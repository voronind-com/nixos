{ container, pkgs, util, ... } @args: let
	cfg = container.config.rabbitmq;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.rabbitmq = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/rabbitmq" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.rabbitmq = {
				enable = true;
				listenAddress = cfg.address;
				port          = cfg.port;
				dataDir       = "/var/lib/rabbitmq";
			};
		};
	};
}
