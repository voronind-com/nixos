{ const, color, style, pkgs, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			const    = const;
			homeDir  = "/home/dasha";
			pkgs     = pkgs;
			style    = style;
			username = "dasha";
		})
	];
}
