{ const, username, homeDir, util, style, pkgs, setting, key, secret, ... } @args: let
	foot         = import ./foot         args;
	mako         = import ./mako         args;
	editorconfig = import ./editorconfig args;
	btop         = import ./top/btop     args;
	htop         = import ./top/htop     args;
	gtk3         = import ./gtk/3        args;
in {
	home-manager = {
		backupFileExtension = "old";

		users.${username} = {
			home = {
				username      = username;
				homeDirectory = homeDir;
				stateVersion  = const.stateVersion;
				file = {
					".config/btop/btop.conf".text    = btop.config;
					".config/foot/foot.ini".text     = foot.config;
					".config/gtk-3.0/bookmarks".text = gtk3.bookmarks;
					".config/htop/htoprc".text       = htop.config;
					".config/mako/config".text       = mako.config;
					".editorconfig".text             = editorconfig.config;
					".parallel/will-cite".text       = "";
					"media/template".source          = ./template;
				};
			};

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

			programs = {
				home-manager.enable = true;
				gpg = {
					enable = true;
					publicKeys = secret.crypto.publicKeys;
				};
			};
		};
	};
}

