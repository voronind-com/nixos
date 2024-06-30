{ ... }: {
	imports = [
		./Fprint.nix
	];

	# Keyd Print to Macro remap.
	services.keyd.keyboards.default.settings.main.print = "layer(layer_macro)";

	home.nixos.enable    = true;
	user.voronind.enable = true;

	module = {
		# builder.client.enable      = true;
		intel.cpu.enable           = true;
		powerlimit.thinkpad.enable = true;
		print.enable               = true;
		desktop = {
			sway.enable = true;
			app = {
				common.enable   = true;
				desktop.enable  = true;
				gaming.enable   = true;
				dev.enable      = true;
				extra.enable    = true;
			};
		};
	};
}
