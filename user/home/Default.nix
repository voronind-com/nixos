{ const, username, homeDir, config, pkgs, ... }: let
	footConfig = import ./module/foot/Foot.nix { config = config; };
	makoConfig = import ./module/mako/Mako.nix { config = config; };
in {
	home-manager.backupFileExtension = "old";

	home-manager.users.${username} = {
		programs.home-manager.enable = true;
		home.username      = username;
		home.homeDirectory = homeDir;
		home.stateVersion  = const.stateVersion;

		home.file = {
			".config/btop".source        = ./module/top/btop;
			".config/htop".source        = ./module/top/htop;
			".config/mako/config".text   = makoConfig.config;
			".config/foot/foot.ini".text = footConfig.config;
			".editorconfig".source       = ./module/Editorconfig;
			".parallel/will-cite".text   = "";
			"media/template".source      = ./module/template;
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
				XDG_TMP_DIR = "${homeDir}/tmp/";
			};
		};
	};
}

