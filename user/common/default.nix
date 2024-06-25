# This is a common user configuration.
{ const
, homeDir
, key
, pkgs
, secret
, config
, style
, username
, util
, lib
, ... } @args: with lib; let
	cfg = config.user.common;

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
	options = {
		user.common.users = mkOption {
			default = [{
				name    = "root";
				homeDir = "/root";
			}];
			type = types.listOf types.attrs;
		};
	};

	config = {
		home-manager = {
			users = builtins.foldl' (acc: user: acc // {
				${user.name} = {
					home = {
						username = user.name;
						homeDirectory = user.homeDir;
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
							".config/yazi/theme.toml".source   = yazi.theme;
							".config/yazi/yazi.toml".source    = yazi.yazi;
							".editorconfig".source             = editor.file;
							".parallel/will-cite".text         = "";
							"media/template".source            = ./template;
						};
					};

					xdg.userDirs = {
						enable = true;
						createDirectories = true;
						desktop     = "${user.homeDir}/";
						documents   = "${user.homeDir}/document/";
						download    = "${user.homeDir}/download/";
						music       = "${user.homeDir}/media/music/";
						pictures    = "${user.homeDir}/media/picture/";
						publicShare = "${user.homeDir}/media/share/";
						templates   = "${user.homeDir}/media/template/";
						videos      = "${user.homeDir}/media/video/";
						extraConfig = {
							XDG_TMP_DIR = "${user.homeDir}/tmp/";
						};
					};

					programs = {
						home-manager.enable = true;
						gpg = {
							enable = true;
							inherit (secret.crypto) publicKeys;
						};
					};
				};
			}) {} cfg.users;

			# If file exists, rename it with a new extension.
			backupFileExtension = "old";
		};
	};
}

