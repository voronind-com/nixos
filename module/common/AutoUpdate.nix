{ const, ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "hourly";
		flake       = const.url;
		operation   = "switch";
		persistent  = true;
	};
}
