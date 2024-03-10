{ config, pkgs, ... }: {
	nix.buildMachines = [{
		hostName = "home";
		protocol = "ssh-ng";
		systems  = [
			"x86_64-linux"
			"i686-linux"
			"aarch64-linux"
		];
		maxJobs     = 1;
		speedFactor = 2;
		mandatoryFeatures = [ ];
		supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
	}];
	nix.distributedBuilds = true;
	nix.extraOptions = ''
		builders-use-substitutes = true
		extra-substituters = ssh-ng://home
		extra-trusted-substituters = ssh-ng://home
		extra-trusted-public-keys = home:i9dE2VZI40/LCM/mmUGs8kwal1bQo3xbSjrzxhInmOw=
	'';
}
