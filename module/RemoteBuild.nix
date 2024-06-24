# Module that enables remote builds. This is a client configuration.
{ lib, secret, ... }: {
	# NOTE: Requires host private key to be present in secret.ssh.builderKeys.
	nix.buildMachines = [{
		hostName = "nixbuilder";
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
	nix.settings = let
		substituters = [ "ssh-ng://nixbuilder" ];
	in {
		substituters = lib.mkForce substituters;
		trusted-substituters = substituters;
		builders-use-substitutes = true;
		max-jobs = 0;
		trusted-public-keys = [ secret.ssh.builderKey ];
		# require-sigs = false;
		# substitute = false;
	};
}
