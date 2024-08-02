{ ... }: {
	imports = [
		./Filesystem.nix
	];

	home.nixos.enable    = true;
	user.voronind.enable = true;

	module = {
		builder.client.enable = true;
		desktop.sway.enable   = true;
		ollama.enable         = true;
		print.enable          = true;
		virtmanager.enable    = true;
		amd = {
			compute.enable = true;
			cpu.enable     = true;
			gpu.enable     = true;
		};
		docker = {
			enable    = true;
			autostart = false;
			rootless  = false;
		};
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
