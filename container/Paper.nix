{ container, pkgs, util, ... } @args: let
	cfg = container.config.paper;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.paper = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/paperless" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { lib, ... }: container.mkContainerConfig cfg {
			services.paperless = {
				enable = true;
				dataDir = "/var/lib/paperless";
				# address = cfg.domain;
				address = "0.0.0.0";
				port    = cfg.port;
				passwordFile = pkgs.writeText "PaperlessPassword" "root";
				settings = {
					PAPERLESS_ADMIN_USER   = "root";
					PAPERLESS_DBHOST       = container.config.postgres.address;
					PAPERLESS_DBENGINE     = "postgresql";
					PAPERLESS_DBNAME       = "paperless";
					PAPERLESS_DBPASS       = "paperless";
					PAPERLESS_DBPORT       = container.config.postgres.port;
					PAPERLESS_DBUSER       = "paperless";
					PAPERLESS_OCR_LANGUAGE = "rus";
					PAPERLESS_REDIS        = "redis://${container.config.redis.address}:${toString container.config.redis.port}";
				};
			};

			# HACK: This is required for TCP postgres connection.
			systemd.services.paperless-scheduler.serviceConfig = {
				PrivateNetwork = lib.mkForce false;
			};
			systemd.services.paperless-consumer.serviceConfig = {
				PrivateNetwork = lib.mkForce false;
			};
		};
	};
}
