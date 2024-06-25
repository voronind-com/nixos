{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	user = {
		dasha.enable    = true;
		voronind.enable = true;
	};

	module = {
		builder.client.enable = true;
		print.enable          = true;
		strongswan.enable     = true;
		tablet.enable         = true;
		amd = {
			compute.enable = true;
			cpu.enable     = true;
			gpu.enable     = true;
		};
	};
}
