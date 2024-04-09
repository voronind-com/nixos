{ ... }: {
	ssh.trustedKeys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEuuw5ek5wGB9KdBhCTxjV+CBpPU6RIOynHkFYC4dau3 root@dasha"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGIf192IxsksM6u8UY+eqpHopebgV+NNq2G03ssdXIgz root@desktop"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSWdbkYsRiDlKu8iT/k+JN4KY08iX9qh4VyqxlpEZcE root@home"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgiYKFkMfiGOZCZIk+O7LtaoF6A3cHEFCqaPwXOM4rR root@work"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDBL5NAm8S97EtfB/7DPf5Xl3Cqi3PlSO1V0m7fknNzz root@laptop"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL2LI1iFDZC223aWqBVz9yusfB/XrRwsBKiL5warIF/ nix-on-droid@phone"
	];

	crypto = {
		sign = {
			format = "ssh";
			key    = "";
		};
		publicKeys = [

		];
	};
}
