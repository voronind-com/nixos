{ container, pkgs, util, ... } @args: let
	cfg = container.config.office;
in {
	containers.office = container.mkContainer cfg {
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

				examplePort = cfg.port;
				enableExampleServer = true;
			};
		};
	};
}
