{ container, lib, ... } @args: let
	cfg = container.config.download;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
	];

	containers.download = container.mkContainer cfg {
		bindMounts = {
			"/var/lib/deluge" = {
				hostPath   = "${cfg.storage}/data";
				isReadOnly = false;
			};
		} // builtins.listToAttrs (lib.imap0 (i: path:
			{
				name = "/download/${toString i}";
				value = {
					hostPath   = path;
					isReadOnly = false;
				};
			}
		) cfg.download);

		config = { ... }: container.mkContainerConfig cfg {
			services.deluge = {
				enable     = true;
				dataDir    = "/var/lib/deluge";
				web.enable = true;
			};
		};
	};
}
