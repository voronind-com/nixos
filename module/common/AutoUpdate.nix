{ ... }: {
	system.autoUpgrade = {
		enable      = true;
		allowReboot = false;
		dates       = "03:00";
		flake       = "git+https://git.voronind.com/voronind/nixos.git";
		operation   = "switch";
		persistent  = true;
	};
}
