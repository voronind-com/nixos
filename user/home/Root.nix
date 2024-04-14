{ const, util, style, pkgs, setting, key, secret, ... } @args: {
	imports = [
		(import ./Default.nix (args // {
			username = "root";
			homeDir  = "/root";
		}))
	];
}
