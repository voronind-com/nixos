{ const, color, pkgs, config, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			config   = config;
			const    = const;
			homeDir  = "/home/voronind";
			pkgs     = pkgs;
			username = "voronind";
		})
	];
}
