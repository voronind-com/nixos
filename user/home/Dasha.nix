{ const, color, config, pkgs, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			config   = config;
			const    = const;
			homeDir  = "/home/dasha";
			pkgs     = pkgs;
			username = "dasha";
		})
	];
}
