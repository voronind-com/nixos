{ ... }: {
	imports = [
		./Backup.nix
		./Container.nix
		./Filesystem.nix
		./Network.nix
		./Photoprocess.nix
	];

	user.voronind.enable = true;

	module = {
		builder.server.enable = true;
		desktop.sway.enable   = true;
		ftpd = {
			enable  = true;
			storage = "/storage/hot/ftp";
		};
		amd = {
			cpu = {
				enable = true;
				powersave.enable = false;
			};
			gpu.enable = true;
		};
	};

	# Disable auto-switch.
	module.common.autoupdate.enable = false;
}
