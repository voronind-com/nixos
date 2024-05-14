{ pkgs, ... }: let
	# Sometimes stylix does not generate enough contrast for text.
	# This setting forces white text to ensure contrast on dark backgrounds.
	forceWhiteText = true;

	url    = "https://pixeldrain.com/api/file/ppeeEr4d";
	sha256 = "sha256-CeKigHd9R6Q4axalcWjHySuOj1RuY68niJ4qoQai4rM=";
in {
	inherit forceWhiteText;

	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
