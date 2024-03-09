{ ... }: {
	users.users.root.openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGIf192IxsksM6u8UY+eqpHopebgV+NNq2G03ssdXIgz root@desktop"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSWdbkYsRiDlKu8iT/k+JN4KY08iX9qh4VyqxlpEZcE root@home"
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
		settings = { # TODO: Migrate from passwords.
			AllowUsers      = [ "root" ];
			LoginGraceTime  = "1m";
			MaxAuthTries    = 4;
			MaxSessions     = 10;
			PermitRootLogin = "yes"; # TODO: Make `prohibit-password`.
			StrictModes     = false;

			UseDns = false;
			UsePAM = true;

			GSSAPIAuthentication         = false;
			HostbasedAuthentication      = false;
			KbdInteractiveAuthentication = true;
			KerberosAuthentication       = false;
			PasswordAuthentication       = true;
			PermitEmptyPasswords         = false;
			PubkeyAuthentication         = true;
		};
	};
}
