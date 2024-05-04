# This is a common user configuration.
{ const
, homeDir
, key
, pkgs
, secret
, setting
, style
, username
, util
, ... } @args: let
	# Configuration modules.
	btop         = import ./top/btop     args;
	editorconfig = import ./editorconfig args;
	foot         = import ./foot         args;
	gtk3         = import ./gtk/3        args;
	htop         = import ./top/htop     args;
	keyd         = import ./keyd         args;
	mako         = import ./mako         args;
in {
	home-manager = {
		# If file exists, rename it with a new extension.
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
					".config/keyd/app.conf".text     = keyd.config;
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

