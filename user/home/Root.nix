{ const, util, style, pkgs, setting, key, ... } @args: {
	imports = [
		(import ./Default.nix (args // {
			username = "root";
			homeDir  = "/root";
		}))
	];
}
