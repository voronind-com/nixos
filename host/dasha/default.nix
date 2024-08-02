{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	home.nixos.enable = true;
	user.dasha.enable = true;

	module = {
		amd.gpu.enable        = true;
		builder.client.enable = true;
		desktop.sway.enable   = true;
		intel.cpu.enable      = true;
		print.enable          = true;
		strongswan.enable     = true;
		tablet.enable         = true;
		package = {
			common.enable   = true;
			core.enable     = true;
			creative.enable = true;
			desktop.enable  = true;
			dev.enable      = true;
			extra.enable    = true;
			gaming.enable   = true;
		};
	};
}
