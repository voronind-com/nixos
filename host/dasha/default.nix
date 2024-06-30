{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	home.nixos.enable = true;
	user.dasha.enable = true;

	module = {
		amd.gpu.enable        = true;
		# builder.client.enable = true;
		intel.cpu.enable      = true;
		print.enable          = true;
		strongswan.enable     = true;
		tablet.enable         = true;
		desktop = {
			sway.enable = true;
			app = {
				common.enable   = true;
				desktop.enable  = true;
				gaming.enable   = true;
				creative.enable = true;
				dev.enable      = true;
				extra.enable    = true;
			};
		};
	};
}
