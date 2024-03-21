{ const, ... }: {
	imports = [
		./home/Root.nix
	];
	users.users.root.hashedPassword = const.hashedPassword;
	security.sudo = {
		enable = false;
		extraConfig = ''
			Defaults rootpw
		'';
	};
}
