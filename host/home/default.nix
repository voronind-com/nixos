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
		autoupdate.enable     = false;
		builder.server.enable = true;
		desktop.sway.enable   = true;
		amd = {
			cpu = {
				enable = true;
				powersave.enable = false;
			};
			gpu.enable = true;
		};
		ftpd = {
			enable  = true;
			storage = "/storage/hot/ftp";
		};
		package = {
			android.enable = true;
			common.enable  = true;
			core.enable    = true;
			desktop.enable = true;
		};
	};
}
