{ pkgs, lib, config, ... }: with lib; let
	cfg = config.module.style;
in {
	options = let
		mkTypeOption  = default: type: mkOption { inherit default type; };
		mkStrOption   = default: mkTypeOption default types.str;
		mkIntOption   = default: mkTypeOption default types.int;
		mkFloatOption = default: mkTypeOption default types.float;
	in {
		module.style = {
			color = {
				bg = {
					dark    = mkStrOption config.lib.stylix.colors.base00;
					light   = mkStrOption config.lib.stylix.colors.base07;
					regular = mkStrOption config.lib.stylix.colors.base01;
				};
				fg = {
					dark    = mkStrOption config.lib.stylix.colors.base04;
					light   = mkStrOption config.lib.stylix.colors.base06;
					regular = mkStrOption config.lib.stylix.colors.base05;
				};
				accent      = mkStrOption config.lib.stylix.colors.base0A;
				heading     = mkStrOption config.lib.stylix.colors.base0D;
				hl          = mkStrOption config.lib.stylix.colors.base03;
				keyword     = mkStrOption config.lib.stylix.colors.base0E;
				link        = mkStrOption config.lib.stylix.colors.base09;
				misc        = mkStrOption config.lib.stylix.colors.base0F;
				negative    = mkStrOption config.lib.stylix.colors.base08;
				neutral     = mkStrOption config.lib.stylix.colors.base0C;
				positive    = mkStrOption config.lib.stylix.colors.base0B;
				selection   = mkStrOption config.lib.stylix.colors.base02;
				transparent = mkStrOption "ffffff00";

				accent-b   = mkStrOption config.lib.stylix.colors.base0A-rgb-b;
				accent-g   = mkStrOption config.lib.stylix.colors.base0A-rgb-g;
				accent-r   = mkStrOption config.lib.stylix.colors.base0A-rgb-r;

				negative-b = mkStrOption config.lib.stylix.colors.base08-rgb-b;
				negative-g = mkStrOption config.lib.stylix.colors.base08-rgb-g;
				negative-r = mkStrOption config.lib.stylix.colors.base08-rgb-r;

				neutral-b  = mkStrOption config.lib.stylix.colors.base0C-rgb-b;
				neutral-g  = mkStrOption config.lib.stylix.colors.base0C-rgb-g;
				neutral-r  = mkStrOption config.lib.stylix.colors.base0C-rgb-r;

				positive-b = mkStrOption config.lib.stylix.colors.base0B-rgb-b;
				positive-g = mkStrOption config.lib.stylix.colors.base0B-rgb-g;
				positive-r = mkStrOption config.lib.stylix.colors.base0B-rgb-r;

				bg-b = mkStrOption config.lib.stylix.colors.base00-rgb-b;
				bg-g = mkStrOption config.lib.stylix.colors.base00-rgb-g;
				bg-r = mkStrOption config.lib.stylix.colors.base00-rgb-r;

				fg-b = mkStrOption config.lib.stylix.colors.base06-rgb-b;
				fg-g = mkStrOption config.lib.stylix.colors.base06-rgb-g;
				fg-r = mkStrOption config.lib.stylix.colors.base06-rgb-r;

				border   = mkStrOption config.lib.stylix.colors.base01;
				border-b = mkStrOption config.lib.stylix.colors.base01-rgb-b;
				border-g = mkStrOption config.lib.stylix.colors.base01-rgb-g;
				border-r = mkStrOption config.lib.stylix.colors.base01-rgb-r;
			};

			font = {
				emoji.name     = mkStrOption config.stylix.fonts.emoji.name;
				monospace.name = mkStrOption config.stylix.fonts.monospace.name;
				sansSerif.name = mkStrOption config.stylix.fonts.sansSerif.name;
				serif.name     = mkStrOption config.stylix.fonts.serif.name;
				size = {
					terminal    = mkIntOption config.stylix.fonts.sizes.terminal;
					popup       = mkIntOption config.stylix.fonts.sizes.popups;
					application = mkIntOption config.stylix.fonts.sizes.applications;
					desktop     = mkIntOption config.stylix.fonts.sizes.desktop;
				};
			};

			opacity = {
				application = mkFloatOption config.stylix.opacity.applications;
				desktop     = mkFloatOption config.stylix.opacity.desktop;
				popup       = mkFloatOption config.stylix.opacity.popups;
				terminal    = mkFloatOption config.stylix.opacity.terminal;
				hex = mkStrOption "D9";
			};

			window = {
				gap    = mkIntOption 8;
				border = mkIntOption 4;
			};
		};
	};
}
