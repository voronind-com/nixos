{ ... }: {
	lib.stylix.colors = {
		base0A = "b8bb26";
		base01 = "3c3836";
		base00 = "1d2021";
		base07 = "504945";
		base05 = "ebdbb2";
		base04 = "a89984";
		base06 = "fbf1c7";
		base0D = "d5c4a1";
		base03 = "98971a";
		base0E = "98971a";
		base09 = "076678";
		base0F = "808080";
		base08 = "cc241d";
		base0C = "458588";
		base0B = "87af87";
		base02 = "87af87";

		base0A-rgb-b = "38";
		base0A-rgb-g = "187";
		base0A-rgb-r = "184";
		base08-rgb-b = "29";
		base08-rgb-g = "36";
		base08-rgb-r = "204";
		base0C-rgb-b = "136";
		base0C-rgb-g = "133";
		base0C-rgb-r = "69";
		base0B-rgb-b = "135";
		base0B-rgb-g = "175";
		base0B-rgb-r = "135";
		base00-rgb-b = "33";
		base00-rgb-g = "32";
		base00-rgb-r = "29";
		base06-rgb-b = "199";
		base06-rgb-g = "241";
		base06-rgb-r = "251";
	};
	stylix = {
		fonts = {
			monospace.name = "Terminess Nerd Font Mono";
			emoji.name     = "Noto Color Emoji";
			serif.name     = "SF Pro Display";
			sansSerif.name = "SF Pro Display";
			sizes = {
				applications = 12;
				terminal     = 12;
				popups       = 12;
				desktop      = 12;
			};
		};
		opacity = {
			application = 1.0;
			desktop     = 1.0;
			popup       = 1.0;
			terminal    = 1.0;
		};
	};
}
