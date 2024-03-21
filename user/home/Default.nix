{ const, username, homeDir, ... }: {
	home-manager.users.${username} = {
		programs.home-manager.enable = true;
		home.username      = username;
		home.homeDirectory = homeDir;
		home.stateVersion  = const.stateVersion;

		home.file = {
			".config/btop".source      = ./module/top/btop;
			".config/gtk-2.0".source   = ./module/gtk/2;
			".config/gtk-3.0".source   = ./module/gtk/3;
			".config/gtk-4.0".source   = ./module/gtk/4;
			".config/htop".source      = ./module/top/htop;
			".editorconfig".source     = ./module/Editorconfig;
			".parallel/will-cite".text = "";
			"app/bin".source           = ./module/bin;
			"media/template".source    = ./module/template;
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

