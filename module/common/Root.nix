{ const, ... }: {
	users.users.root.hashedPassword = const.hashedPassword;
	security.sudo = {
		enable = false;
		extraConfig = ''
			Defaults rootpw
		'';
	};
}
