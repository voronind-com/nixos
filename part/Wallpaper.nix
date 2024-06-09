{ pkgs, ... }: let
	url    = "https://i.imgur.com/EpFhNuM.jpeg";
	sha256 = "sha256-j6c5+f5/KgmGzNfZnMShAXrhbAOhsiNlr0DJh+puyQU=";

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
