{ util, ... } @args: let
	settings = util.catSet (util.ls ./dconf) args;
in {
	# Gnome DE and GTK apps configuration.
	programs.dconf.enable = true;
	programs.dconf.profiles.user = {
		enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
		databases = [{ inherit settings; }];
	};
}
