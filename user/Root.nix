{ const
, util
, style
, pkgs
, config
, key
, secret
, ... } @args: {
	imports = [
		./common
	];

	# user.common.users = [{ name = "root"; homeDir = "/root"; }];
	users.users.root.hashedPassword = secret.hashedPassword;
	security.sudo = {
		enable = false;
		extraConfig = ''
			Defaults rootpw
		'';
	};
}
