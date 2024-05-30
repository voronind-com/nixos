{ pkgs, ... }: let
	url    = "https://i.imgur.com/H943DFl.jpeg";
	sha256 = "sha256-xgfok169eRSu22On2SEcdiUOe8Stpj3f9Ch4IhQ52uY=";

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
