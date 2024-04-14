{ const, util, style, pkgs, setting, key, secret, ... } @args: {
	imports = [
		(import ./common (args // {
			username = "root";
			homeDir  = "/root";
		}))
	];
}
