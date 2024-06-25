{ util, lib, config, ... } @args: with lib; let
	cfg = config.module.desktop.dconf;
	settings = util.catSet (util.ls ./dconf) args;
in {
	options = {
		module.desktop.dconf.enable = mkEnableOption "Dconf.";
	};

	config = mkIf cfg.enable {
		# Gnome DE and GTK apps configuration.
		programs.dconf.enable = true;
		programs.dconf.profiles.user = {
			enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
			databases = [{ inherit settings; }];
		};
	};
}
