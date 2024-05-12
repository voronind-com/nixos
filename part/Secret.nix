{ ... }: {
	# Password used for root user.
	hashedPassword = "$y$j9T$oqCB16i5E2t1t/HAWaFd5.$tTaHtAcifXaDVpTcRv.yH2/eWKxKE9xM8KcqXHfHrD7"; # Use `mkpasswd`.

	ssh = {
		# Keys that are allowed to connect via SSH.
		trustedKeys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL2LI1iFDZC223aWqBVz9yusfB/XrRwsBKiL5warIF/ nix-on-droid@phone"
			(builtins.readFile ./secret/public/Ssh.key)
		];

		# Keys that are allowd to connect via SSH to nixbuild user for Nix remote builds.
		builderKeys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEuuw5ek5wGB9KdBhCTxjV+CBpPU6RIOynHkFYC4dau3 root@dasha"
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGIf192IxsksM6u8UY+eqpHopebgV+NNq2G03ssdXIgz root@desktop"
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSWdbkYsRiDlKu8iT/k+JN4KY08iX9qh4VyqxlpEZcE root@home"
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgiYKFkMfiGOZCZIk+O7LtaoF6A3cHEFCqaPwXOM4rR root@work"
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBA+KKCkFOshUznJlXW/LDie0vZLd4b+KWodSm8N8vM+ root@laptop"
			(builtins.readFile ./secret/public/Ssh.key)
		];
	};

	crypto = {
		# Git commit signing.
		sign.git = {
			format  = "ssh";
			key     = ./secret/public/Ssh.key;
			allowed = ./secret/public/Signers.key;
		};

		# List of accepted public keys.
		publicKeys = [
			{
				source = ./secret/public/Gpg.key;
				trust  = 5;
			}
		];
	};
}
