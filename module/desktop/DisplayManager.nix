{ setting, ... }: {
	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable   = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.xkb = {
		layout  = setting.keyboard.layouts;
		options = setting.keyboard.options;
	};
}
