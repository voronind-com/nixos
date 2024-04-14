{ const, ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "hourly";
		flake       = "git+${const.url}";
		operation   = "switch";
		persistent  = true;
	};
}
