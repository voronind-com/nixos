# NOTE: Imperative part:
# 1. You need to change PSQL tables owner from root to onlyoffice, too. They don't do that automatically for some reason.
# 2. TODO: Generate JWT secret at /var/lib/onlyoffice/jwt, i.e. 9wLfMGha1YrfvWpb5hyYjZf8pvJQ3swS
# See https://git.voronind.com/voronind/nixos/issues/74
{ container, pkgs, util, ... } @args: let
	cfg = container.config.office;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.office = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/onlyoffice" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.onlyoffice = let
				dbName = "onlyoffice";
			in {
				enable   = true;
				hostname = cfg.domain;

				postgresName = dbName;
				postgresHost = container.config.postgres.address;
				postgresUser = dbName;
				postgresPasswordFile = "${pkgs.writeText "OfficeDbPassword" dbName}";

				jwtSecretFile = "/var/lib/onlyoffice/jwt";

				examplePort = cfg.port;
				enableExampleServer = true;
			};
		};
	};
}
