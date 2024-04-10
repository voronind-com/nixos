{ config, ... }: {
	color = {
		bg = {
			regular = config.lib.stylix.colors.base01;
			dark    = config.lib.stylix.colors.base00;
			light   = config.lib.stylix.colors.base07;
		};
		fg = {
			regular = config.lib.stylix.colors.base05;
			dark    = config.lib.stylix.colors.base04;
			light   = config.lib.stylix.colors.base06;
		};
		accent      = config.lib.stylix.colors.base0A;
		heading     = config.lib.stylix.colors.base0D;
		hl          = config.lib.stylix.colors.base03;
		keyword     = config.lib.stylix.colors.base0E;
		link        = config.lib.stylix.colors.base09;
		misc        = config.lib.stylix.colors.base0F;
		negative    = config.lib.stylix.colors.base08;
		neutral     = config.lib.stylix.colors.base0C;
		positive    = config.lib.stylix.colors.base0B;
		selection   = config.lib.stylix.colors.base02;
		transparent = "ffffff00";

		accent-b   = config.lib.stylix.colors.base0A-rgb-b;
		accent-g   = config.lib.stylix.colors.base0A-rgb-g;
		accent-r   = config.lib.stylix.colors.base0A-rgb-r;
		negative-b = config.lib.stylix.colors.base08-rgb-b;
		negative-g = config.lib.stylix.colors.base08-rgb-g;
		negative-r = config.lib.stylix.colors.base08-rgb-r;
		neutral-b  = config.lib.stylix.colors.base0C-rgb-b;
		neutral-g  = config.lib.stylix.colors.base0C-rgb-g;
		neutral-r  = config.lib.stylix.colors.base0C-rgb-r;
		positive-b = config.lib.stylix.colors.base0B-rgb-b;
		positive-g = config.lib.stylix.colors.base0B-rgb-g;
		positive-r = config.lib.stylix.colors.base0B-rgb-r;
	};

	font = {
		emoji.name     = config.stylix.fonts.emoji.name;
		monospace.name = config.stylix.fonts.monospace.name;
		sansSerif.name = config.stylix.fonts.sansSerif.name;
		serif.name     = config.stylix.fonts.serif.name;
		size = {
			terminal    = config.stylix.fonts.sizes.terminal;
			popup       = config.stylix.fonts.sizes.popups;
			application = config.stylix.fonts.sizes.applications;
			desktop     = config.stylix.fonts.sizes.desktop;
		};
	};

	opacity = {
		application = config.stylix.opacity.applications;
		desktop     = config.stylix.opacity.desktop;
		popup       = config.stylix.opacity.popups;
		terminal    = config.stylix.opacity.terminal;
	};
}
