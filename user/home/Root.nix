{ const, color, ... }: {
	imports = [
		(import ./Default.nix {
			color    = color;
			const    = const;
			username = "root";
			homeDir  = "/root";
		})
	];
}
