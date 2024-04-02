{ const, color, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			const    = const;
			username = "voronind";
			homeDir  = "/home/voronind";
		})
	];
}
