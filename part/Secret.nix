{ ... }: {
	ssh = {
		trustedKeys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL2LI1iFDZC223aWqBVz9yusfB/XrRwsBKiL5warIF/ nix-on-droid@phone"
			(builtins.readFile ./secret/public/Ssh.key)
		];

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
		sign = {
			format  = "ssh";
			key     = ./secret/public/Ssh.key;
			allowed = ./secret/public/Signers.key;
		};
		publicKeys = [
			{
				source = ./secret/public/Gpg.key;
				trust  = 5;
			}
		];
	};
}
