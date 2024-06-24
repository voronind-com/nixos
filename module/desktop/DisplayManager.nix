{ config, ... }: {
	services.xserver.enable = true;
	services.xserver.xkb = {
		layout  = config.setting.keyboard.layouts;
		options = config.setting.keyboard.options;
	};
}
