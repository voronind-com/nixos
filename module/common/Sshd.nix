{ ... }: {
	users.users.root.openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEuuw5ek5wGB9KdBhCTxjV+CBpPU6RIOynHkFYC4dau3 root@dasha"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGIf192IxsksM6u8UY+eqpHopebgV+NNq2G03ssdXIgz root@desktop"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSWdbkYsRiDlKu8iT/k+JN4KY08iX9qh4VyqxlpEZcE root@home"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgiYKFkMfiGOZCZIk+O7LtaoF6A3cHEFCqaPwXOM4rR root@work"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL2LI1iFDZC223aWqBVz9yusfB/XrRwsBKiL5warIF/ nix-on-droid@phone"
	];
	services.openssh = {
		enable    = true;
		allowSFTP = true;
		ports = [ 22143 ];
		listenAddresses = [
			{
				addr = "0.0.0.0";
				port = 22143;
			}
		];
		settings = {
			AllowUsers      = [ "root" ];
			LoginGraceTime  = "1m";
			MaxAuthTries    = 1;
			MaxSessions     = 10;
			PermitRootLogin = "prohibit-password";
			StrictModes     = false;

			UseDns = false;
			UsePAM = true;

			GSSAPIAuthentication         = false;
			HostbasedAuthentication      = false;
			KbdInteractiveAuthentication = false;
			KerberosAuthentication       = false;
			PasswordAuthentication       = false;
			PermitEmptyPasswords         = false;
			PubkeyAuthentication         = true;
		};
	};
}
