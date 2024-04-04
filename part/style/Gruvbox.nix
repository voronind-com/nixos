{ ... }: {
	lib.stylix.colors = {
		accent      = "b8bb26";
		bg          = "3c3836";
		bg_dark     = "1d2021";
		bg_light    = "504945";
		fg          = "ebdbb2";
		fg_dark     = "a89984";
		fg_light    = "fbf1c7";
		heading     = "d5c4a1";
		hl          = "98971a";
		keyword     = "98971a";
		link        = "076678";
		misc        = "808080";
		negative    = "cc241d";
		neutral     = "458588";
		positive    = "87af87";
		selection   = "87af87";

		accent-b   = "38";
		accent-g   = "187";
		accent-r   = "184";
		negative-b = "29";
		negative-g = "36";
		negative-r = "204";
		neutral-b  = "136";
		neutral-g  = "133";
		neutral-r  = "69";
		positive-b = "135";
		positive-g = "175";
		positive-r = "135";
	};
	stylix = {
		fonts = {
			monospace.name = "Terminess Nerd Font Mono";
			emoji.name     = "Noto Color Emoji";
			sans.name      = "SF Pro Display";
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
