{ lib, ... }: with lib; let
	mkTypeOption  = default: type: mkOption { inherit default type; };
	mkStrOption   = default: mkTypeOption default types.str;
	mkIntOption   = default: mkTypeOption default types.int;
	mkFloatOption = default: mkTypeOption default types.float;
in {
	options.style = {
		color = {
			bg = {
				dark    = mkStrOption "1d2021";
				light   = mkStrOption "504945";
				regular = mkStrOption "3c3836";
			};
			fg = {
				dark    = mkStrOption "a89984";
				light   = mkStrOption "fbf1c7";
				regular = mkStrOption "ebdbb2";
			};
			accent      = mkStrOption "b8bb26";
			heading     = mkStrOption "d5c4a1";
			hl          = mkStrOption "98971a";
			keyword     = mkStrOption "98971a";
			link        = mkStrOption "076678";
			misc        = mkStrOption "808080";
			negative    = mkStrOption "cc241d";
			neutral     = mkStrOption "458588";
			positive    = mkStrOption "87af87";
			selection   = mkStrOption "87af87";
			transparent = mkStrOption "ffffff00";

			accent-b   = mkStrOption "38";
			accent-g   = mkStrOption "187";
			accent-r   = mkStrOption "184";

			negative-b = mkStrOption "29";
			negative-g = mkStrOption "36";
			negative-r = mkStrOption "204";

			neutral-b  = mkStrOption "136";
			neutral-g  = mkStrOption "133";
			neutral-r  = mkStrOption "69";

			positive-b = mkStrOption "135";
			positive-g = mkStrOption "175";
			positive-r = mkStrOption "135";

			bg-b = mkStrOption "33";
			bg-g = mkStrOption "32";
			bg-r = mkStrOption "29";

			fg-b = mkStrOption "199";
			fg-g = mkStrOption "241";
			fg-r = mkStrOption "251";

			border   = mkStrOption "3c3836";
			border-b = mkStrOption "54";
			border-g = mkStrOption "56";
			border-r = mkStrOption "60";
		};

		fonts = {
			monospace.name = mkStrOption "Terminess Nerd Font Mono";
			emoji.name     = mkStrOption "Noto Color Emoji";
			serif.name     = mkStrOption "SF Pro Display";
			sansSerif.name = mkStrOption "SF Pro Display";
			sizes = {
				applications = mkIntOption 12;
				terminal     = mkIntOption 12;
				popups       = mkIntOption 12;
				desktop      = mkIntOption 12;
			};
		};

		opacity = {
			application = mkFloatOption 1.0;
			desktop     = mkFloatOption 1.0;
			popup       = mkFloatOption 1.0;
			terminal    = mkFloatOption 1.0;
		};
	};
}
