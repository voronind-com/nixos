{ ... }: {
	imports = [
		./Fprint.nix
	];

	# Keyd Print to Macro remap.
	services.keyd.keyboards.default.settings.main.print = "layer(layer_macro)";
}
