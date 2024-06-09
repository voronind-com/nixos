{ container, ... } @args: let
	cfg = container.config.watch;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
		"cache"
	];

	containers.watch = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/jellyfin" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
			"/var/cache/jellyfin" = {
				hostPath   = "${cfg.storage}/cache";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			services.jellyfin = {
				enable   = true;
				cacheDir = "/var/cache/jellyfin";
				dataDir  = "/var/lib/jellyfin";
			};
		};
	};
}
