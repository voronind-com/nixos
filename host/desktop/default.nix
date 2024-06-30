{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	home.nixos.enable    = true;
	user.voronind.enable = true;

	module = {
		# builder.client.enable = true;
		print.enable          = true;
		virtmanager.enable    = true;
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
				creative.enable = true;
				dev.enable      = true;
				extra.enable    = true;
				gaming.enable   = true;
			};
		};
		docker = {
			enable    = true;
			autostart = false;
			rootless  = false;
		};
		ollama = {
			enable = true;
			models = [
				"llama3"
				"llama3:70b"
			];
		};
	};
}
