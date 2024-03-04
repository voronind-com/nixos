{ pkgs, inputs, lib, config, ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "daily";
		flake       = "git+https://git.voronind.com/voronind/nixos.git";
		operation   = "boot";
		persistent  = true;
	};
}
