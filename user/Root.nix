{ const
, util
, style
, pkgs
, setting
, key
, secret
, ... } @args: {
	imports = [
		(import ./common (args // {
			username = "root";
			homeDir  = "/root";
		}))
	];

	users.users.root.hashedPassword = secret.hashedPassword;
	security.sudo = {
		enable = false;
		extraConfig = ''
			Defaults rootpw
		'';
	};
}
