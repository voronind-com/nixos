# NOTE: Imperative part:
# 1. You need to change PSQL tables owner from root to onlyoffice, too. They don't do that automatically for some reason.
# 2. TODO: Generate JWT secret at /var/lib/onlyoffice/jwt, i.e. 9wLfMGha1YrfvWpb5hyYjZf8pvJQ3swS
# See https://git.voronind.com/voronind/nixos/issues/74
{ container, pkgs, util, lib, config, ... }: with lib; let
	cfg = config.container.module.office;
in {
	options = {
		container.module.office = {
			enable = mkEnableOption "Office web suite.";
			address = mkOption {
				default = "10.1.0.21";
				type    = types.str;
			};
			port = mkOption {
				default = 8000;
				type    = types.int;
			};
			domain = mkOption {
				default = "office.${config.container.domain}";
				type    = types.str;
			};
			storage = mkOption {
				default = "${config.container.storage}/office";
				type    = types.str;
			};
		};
	};

	config = mkIf cfg.enable {
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

			config = { pkgs, ... }: container.mkContainerConfig cfg {
				services.onlyoffice = let
					dbName = "onlyoffice";
				in {
					enable   = true;
					hostname = cfg.domain;

					postgresName = dbName;
					postgresHost = config.container.module.postgres.address;
					postgresUser = dbName;
					postgresPasswordFile = "${pkgs.writeText "OfficeDbPassword" dbName}";

					jwtSecretFile = "/var/lib/onlyoffice/jwt";

					rabbitmqUrl = "amqp://guest:guest@${config.container.module.rabbitmq.address}:${toString config.container.module.rabbitmq.port}";

					examplePort = cfg.port;
					enableExampleServer = true;
				};
			};
		};
	};
}
