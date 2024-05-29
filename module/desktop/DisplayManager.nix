{ setting, ... }: {
	services.xserver.enable = true;
	services.xserver.xkb = {
		layout  = setting.keyboard.layouts;
		options = setting.keyboard.options;
	};
}
