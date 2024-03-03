{ pkgs, inputs, lib, config, ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "daily";
		flake       = "/root/.config/linux/system";
		operation   = "boot";
		persistent  = true;
	};
}
