{ pkgs, ... }: let
	url    = "https://i.imgur.com/CrX0Grv.png";
	sha256 = "sha256-b9kHrg+EtLCQvIgpvv4hFp79jswAurntty3YnFKr5j0=";

	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceContrastText = true;
in {
	inherit forceContrastText;

	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
