{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	user.voronind.enable = true;

	module = {
		builder.client.enable = true;
		desktop.sway.enable   = true;
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
		ollama = {
			enable = true;
			models = [
				"llama3"
				"llama3:70b"
			];
		};
	};
}
