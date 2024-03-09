{ config, pkgs, ... }: {
	nix.buildMachines = [{
		hostName = "home";
		protocol = "ssh-ng";
		system   = "x86_64-linux";
		maxJobs     = 1;
		speedFactor = 2;
		mandatoryFeatures = [ ];
		supportedFeatures = [ ];
		# supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
	}];
	nix.distributedBuilds = true;
	nix.extraOptions = ''
		builders-use-substitutes = true
	'';
}
