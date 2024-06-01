{ container, ... } @args: let
	cfg = container.config.change;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.change = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/changedetection-io" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.changedetection-io = {
				enable        = true;
				baseURL       = cfg.domain;
				behindProxy   = true;
				listenAddress = cfg.address;
			};
		};
	};
}
