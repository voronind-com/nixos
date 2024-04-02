{ const, color, pkgs, config, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			config   = config;
			const    = const;
			homeDir  = "/root";
			pkgs     = pkgs;
			username = "root";
		})
	];
}
