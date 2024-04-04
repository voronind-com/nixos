{ const, color, pkgs, style, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			const    = const;
			homeDir  = "/root";
			pkgs     = pkgs;
			style    = style;
			username = "root";
		})
	];
}
