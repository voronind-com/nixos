{ const, color, pkgs, style, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			const    = const;
			homeDir  = "/home/voronind";
			pkgs     = pkgs;
			style    = style;
			username = "voronind";
		})
	];
}
