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
	btop   = import ./top/btop     args;
	editor = import ./editorconfig args;
	foot   = import ./foot         args;
	fuzzel = import ./fuzzel       args;
	gtk3   = import ./gtk/3        args;
	htop   = import ./top/htop     args;
	keyd   = import ./keyd         args;
	mako   = import ./mako         args;
	yazi   = import ./yazi         args;
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
					".config/btop/btop.conf".text      = btop.text;
					".config/foot/foot.ini".source     = foot.file;
					".config/fuzzel/fuzzel.ini".source = fuzzel.file;
					".config/gtk-3.0/bookmarks".text   = gtk3.bookmarks;
					".config/htop/htoprc".text         = htop.text;
					".config/keyd/app.conf".text       = keyd.text;
					".config/mako/config".source       = mako.file;
					".config/yazi/init.lua".source     = yazi.init;
					".config/yazi/keymap.toml".source  = yazi.keymap;
					".config/yazi/yazi.toml".source    = yazi.yazi;
					".editorconfig".source             = editor.file;
					".parallel/will-cite".text         = "";
					"media/template".source            = ./template;
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

