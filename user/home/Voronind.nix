{ inputs, ... }: let
	username = "voronind";
	homeDir  = "/home/voronind";
in {
	home-manager.users.voronind = {
		programs.home-manager.enable = true;
		home.username      = username;
		home.homeDirectory = homeDir;
		home.stateVersion  = inputs.self.nixosModules.const.stateVersion;

		home.file = {
			"app/bin".source = ./module/bin;
			".parallel/will-cite".text = "";
			".config/btop".source = ./module/top/btop;
			".config/htop".source = ./module/top/htop;
			".config/gtk-2.0".source = ./module/gtk/2;
			".config/gtk-3.0".source = ./module/gtk/3;
			".config/gtk-4.0".source = ./module/gtk/4;
		};

		# Directories.
		xdg.userDirs = {
			enable = true;
			createDirectories = true;
			desktop     = "${homeDir}/";
			documents   = "${homeDir}/document/";
			download    = "${homeDir}/download/";
			music       = "${homeDir}/media/music/";
			pictures    = "${homeDir}/media/picture/";
			publicShare = "${homeDir}/media/share/";
			templates   = "${homeDir}/media/template/";
			videos      = "${homeDir}/media/video/";
			extraConfig = {
				XDG_APP_DIR = "${homeDir}/app/";
				XDG_TMP_DIR = "${homeDir}/tmp/";
			};
		};
	};
}
