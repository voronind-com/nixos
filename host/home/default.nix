{ ... }: {
	imports = [
		./Backup.nix
		./Container.nix
		./Filesystem.nix
		./Network.nix
		./Photoprocess.nix
		./YaMusicDownload.nix
	];

	home.nixos.enable    = true;
	user.voronind.enable = true;

	module = {
		autoupdate.enable = false;
		builder.server.enable = true;
		desktop = {
			sway.enable = true;
			app = {
				common.enable  = true;
				desktop.enable = true;
			};
		};
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
}
