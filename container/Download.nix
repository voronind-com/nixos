{ container, lib, ... } @args: let
	cfg = container.config.download;
	memLimit = "4G";
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.download = container.mkContainer cfg {
		enableTun = true;

		bindMounts = {
			"/var/lib/deluge/.config/deluge" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		} // container.attachMedia "download" cfg.download false;

		config = { ... }: container.mkContainerConfig cfg {
			services.deluge = {
				enable     = true;
				dataDir    = "/var/lib/deluge";
				web.enable = true;
			};

			systemd.services.deluged.serviceConfig.MemoryLimit = memLimit;
		};
	};
}
