{ container, lib, ... } @args: let
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
			"/dev/dri" = {
				hostPath   = "/dev/dri";
				isReadOnly = false;
			};
		}
		// container.attachMedia "anime"    cfg.anime    true
		// container.attachMedia "download" cfg.download true
		// container.attachMedia "movie"    cfg.movie    true
		// container.attachMedia "music"    cfg.music    true
		// container.attachMedia "photo"    cfg.photo    true
		// container.attachMedia "porn"     cfg.porn     true
		// container.attachMedia "show"     cfg.show     true
		// container.attachMedia "study"    cfg.study    true
		// container.attachMedia "work"     cfg.work     true
		// container.attachMedia "youtube"  cfg.youtube  true
		;

		allowedDevices = [
			{
				modifier = "rwm";
				node = "/dev/dri";
			}
		];

		config = { ... }: container.mkContainerConfig cfg {
			services.jellyfin = {
				enable   = true;
				cacheDir = "/var/cache/jellyfin";
				dataDir  = "/var/lib/jellyfin";
			};
		};
	};
}
