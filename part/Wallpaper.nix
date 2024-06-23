{ pkgs, ... }: let
	url    = "https://i.imgur.com/0RldJsX.jpeg";
	sha256 = "sha256-hbbUz9+m/bLahDiflAoio6+4H0DHfxlbh92cWSjE4R4=";

	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceContrastText = false;
in {
	inherit forceContrastText;

	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
