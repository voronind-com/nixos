{ lib, config, ... }: with lib; let
	cfg = config.style;

	mkTypeOption  = default: type: mkOption { inherit default type; };
	mkStrOption   = default: mkTypeOption default types.str;
	mkIntOption   = default: mkTypeOption default types.int;
	mkFloatOption = default: mkTypeOption default types.float;
in {
	options.style = {
		color = {
			bg = {
				dark    = mkStrOption config.home-manager.config.lib.stylix.colors.base00;
				light   = mkStrOption config.home-manager.config.lib.stylix.colors.base07;
				regular = mkStrOption config.home-manager.config.lib.stylix.colors.base01;
			};
			fg = {
				dark    = mkStrOption config.home-manager.config.lib.stylix.colors.base04;
				light   = mkStrOption config.home-manager.config.lib.stylix.colors.base06;
				regular = mkStrOption config.home-manager.config.lib.stylix.colors.base05;
			};
			accent      = mkStrOption config.home-manager.config.lib.stylix.colors.base0A;
			heading     = mkStrOption config.home-manager.config.lib.stylix.colors.base0D;
			hl          = mkStrOption config.home-manager.config.lib.stylix.colors.base03;
			keyword     = mkStrOption config.home-manager.config.lib.stylix.colors.base0E;
			link        = mkStrOption config.home-manager.config.lib.stylix.colors.base09;
			misc        = mkStrOption config.home-manager.config.lib.stylix.colors.base0F;
			negative    = mkStrOption config.home-manager.config.lib.stylix.colors.base08;
			neutral     = mkStrOption config.home-manager.config.lib.stylix.colors.base0C;
			positive    = mkStrOption config.home-manager.config.lib.stylix.colors.base0B;
			selection   = mkStrOption config.home-manager.config.lib.stylix.colors.base02;
			transparent = mkStrOption "ffffff00";

			accent-b   = mkStrOption config.home-manager.config.lib.stylix.colors.base0A-rgb-b;
			accent-g   = mkStrOption config.home-manager.config.lib.stylix.colors.base0A-rgb-g;
			accent-r   = mkStrOption config.home-manager.config.lib.stylix.colors.base0A-rgb-r;

			negative-b = mkStrOption config.home-manager.config.lib.stylix.colors.base08-rgb-b;
			negative-g = mkStrOption config.home-manager.config.lib.stylix.colors.base08-rgb-g;
			negative-r = mkStrOption config.home-manager.config.lib.stylix.colors.base08-rgb-r;

			neutral-b  = mkStrOption config.home-manager.config.lib.stylix.colors.base0C-rgb-b;
			neutral-g  = mkStrOption config.home-manager.config.lib.stylix.colors.base0C-rgb-g;
			neutral-r  = mkStrOption config.home-manager.config.lib.stylix.colors.base0C-rgb-r;

			positive-b = mkStrOption config.home-manager.config.lib.stylix.colors.base0B-rgb-b;
			positive-g = mkStrOption config.home-manager.config.lib.stylix.colors.base0B-rgb-g;
			positive-r = mkStrOption config.home-manager.config.lib.stylix.colors.base0B-rgb-r;

			bg-b = mkStrOption config.home-manager.config.lib.stylix.colors.base00-rgb-b;
			bg-g = mkStrOption config.home-manager.config.lib.stylix.colors.base00-rgb-g;
			bg-r = mkStrOption config.home-manager.config.lib.stylix.colors.base00-rgb-r;

			fg-b = mkStrOption config.home-manager.config.lib.stylix.colors.base06-rgb-b;
			fg-g = mkStrOption config.home-manager.config.lib.stylix.colors.base06-rgb-g;
			fg-r = mkStrOption config.home-manager.config.lib.stylix.colors.base06-rgb-r;

			border   = mkStrOption config.home-manager.config.lib.stylix.colors.base01;
			border-b = mkStrOption config.home-manager.config.lib.stylix.colors.base01-rgb-b;
			border-g = mkStrOption config.home-manager.config.lib.stylix.colors.base01-rgb-g;
			border-r = mkStrOption config.home-manager.config.lib.stylix.colors.base01-rgb-r;
		};

		font = {
			emoji.name     = mkStrOption config.home-manager.config.stylix.fonts.emoji.name;
			monospace.name = mkStrOption config.home-manager.config.stylix.fonts.monospace.name;
			sansSerif.name = mkStrOption config.home-manager.config.stylix.fonts.sansSerif.name;
			serif.name     = mkStrOption config.home-manager.config.stylix.fonts.serif.name;
			size = {
				terminal    = mkIntOption config.home-manager.config.stylix.fonts.sizes.terminal;
				popup       = mkIntOption config.home-manager.config.stylix.fonts.sizes.popups;
				application = mkIntOption config.home-manager.config.stylix.fonts.sizes.applications;
				desktop     = mkIntOption config.home-manager.config.stylix.fonts.sizes.desktop;
			};
		};

		opacity = {
			application = mkFloatOption config.home-manager.config.stylix.opacity.applications;
			desktop     = mkFloatOption config.home-manager.config.stylix.opacity.desktop;
			popup       = mkFloatOption config.home-manager.config.stylix.opacity.popups;
			terminal    = mkFloatOption config.home-manager.config.stylix.opacity.terminal;
			hex = mkStrOption "D9";
		};

		window = {
			gap    = mkIntOption 8;
			border = mkIntOption 4;
		};
	};
}
