{ ... }: {
	imports = [
		./Filesystem.nix
	];

	home.nixos.enable = true;
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
		desktop = {
			sway.enable = true;
			app = {
				common.enable   = true;
				desktop.enable  = true;
				gaming.enable   = true;
				creative.enable = true;
				dev.enable      = true;
			};
		};
	};
}
