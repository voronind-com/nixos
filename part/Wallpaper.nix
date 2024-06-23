{ pkgs, ... }: let
	url    = "https://i.imgur.com/rmRsEtO.jpeg";
	sha256 = "sha256-def6O2CEjubDfKiL/d7h9IE+Q5bXa4iY093nzl0t8oA=";

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
