{ pkgs, ... }: let
	url    = "https://i.imgur.com/PYKK4Tg.jpeg";
	sha256 = "sha256-lM/EHVPj0Yoxd86002YnFaWbWd48wBIJOFTv+eKJH1g=";

	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceWhiteText = false;
in {
	inherit forceWhiteText;

	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
