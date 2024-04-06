{ const, username, homeDir, util, style, pkgs, setting, key, ... } @args: let
	foot         = import ./module/foot/Init.nix         args;
	mako         = import ./module/mako/Init.nix         args;
	editorconfig = import ./module/editorconfig/Init.nix args;
	btop         = import ./module/top/btop/Init.nix     args;
	htop         = import ./module/top/htop/Init.nix     args;
in {
	home-manager.backupFileExtension = "old";

	home-manager.users.${username} = {
		programs.home-manager.enable = true;
		home.username      = username;
		home.homeDirectory = homeDir;
		home.stateVersion  = const.stateVersion;

		home.file = {
			".config/btop/btop.conf".text = btop.config;
			".config/htop/htoprc".text    = htop.config;
			".config/mako/config".text    = mako.config;
			".config/foot/foot.ini".text  = foot.config;
			".editorconfig".text          = editorconfig.config;
			".parallel/will-cite".text    = "";
			"media/template".source       = ./module/template;
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

