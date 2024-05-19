{ lib, ... }: {
	imports = [
		./Fprint.nix
	];

	# Keyd Print to Macro remap.
	services.keyd.keyboards.default.settings.main.print = "layer(layer_macro)";

	# Reduce font size.
	stylix.fonts.sizes = {
		applications = lib.mkForce 10;
		terminal     = lib.mkForce 8;
	};
}
