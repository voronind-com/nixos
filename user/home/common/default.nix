{ const, username, homeDir, util, style, pkgs, setting, key, secret, ... } @args: let
	foot         = import ./foot         args;
	mako         = import ./mako         args;
	editorconfig = import ./editorconfig args;
	btop         = import ./top/btop     args;
	htop         = import ./top/htop     args;
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
			"media/template".source       = ./template;
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

		# GPG.
		programs.gpg = {
			enable     = true;
			publicKeys = secret.crypto.publicKeys;
		};
	};
}

