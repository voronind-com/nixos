{ container, ... } @args: let
	cfg = container.config.status;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.status = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/uptime-kuma" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { lib, ... }: container.mkContainerConfig cfg {
			networking = {
				nameservers = lib.mkForce [
					container.config.dns.address
				];
			};
			services.uptime-kuma = {
				enable = true;
				settings = {
					DATA_DIR = "/var/lib/uptime-kuma/";
					HOST = cfg.address;
					PORT = toString cfg.port;
				};
			};

			systemd.services.uptime-kuma = {
				serviceConfig.DynamicUser = lib.mkForce false;
			};
		};
	};
}

