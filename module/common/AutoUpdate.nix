{ ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "hourly";
		flake       = "git+https://git.voronind.com/voronind/nixos.git";
		operation   = "switch";
		persistent  = true;
	};
}
