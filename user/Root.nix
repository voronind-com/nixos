{ secret, ... }: {
	imports = [
		./home/Root.nix
	];
	users.users.root.hashedPassword = secret.hashedPassword;
	security.sudo = {
		enable = false;
		extraConfig = ''
			Defaults rootpw
		'';
	};
}
