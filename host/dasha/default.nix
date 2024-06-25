{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	user.dasha.enable = true;

	module = {
		amd.gpu.enable        = true;
		builder.client.enable = true;
		desktop.sway.enable   = true;
		intel.cpu.enable      = true;
		print.enable          = true;
		strongswan.enable     = true;
		tablet.enable         = true;
	};
}
