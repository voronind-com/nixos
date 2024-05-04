{ lib, ... }: {
	# Force specific PW for this host.
	users.users.root.hashedPassword = lib.mkForce "$y$j9T$d4HfwutZr.eNHuLJYRuro/$7swZfgCNS6jEXHFCxsW5um/68jX9BRiiZD1BYcm/gD/";

	# Allow login with PW for others.
	# services.openssh.settings.PasswordAuthentication = lib.mkForce true;
	# services.openssh.settings.PermitRootLogin        = lib.mkForce "yes";
}
