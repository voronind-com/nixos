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
		extra-substituters = ssh-ng://nixbuilder
		extra-trusted-substituters = ssh-ng://nixbuilder
		extra-trusted-public-keys = nixbuilder-1:Skghjixd8lPzNe2ZEgYLM9Pu/wF9wiZtZGsdm3bo9h0=
	'';
}
