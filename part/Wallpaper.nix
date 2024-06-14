{ pkgs, ... }: let
	url    = "https://i.imgur.com/uxNas3C.jpeg";
	sha256 = "sha256-OxixfSixKYDhNx2vxGV5fLeGrHHV1uXS4MJHLnCIFZs=";

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
