{ pkgs, ... }: let
	url    = "https://4kwallpapers.com/images/wallpapers/tuscany-pixel-art-3840x2160-15225.jpg";
	sha256 = "sha256-kc87Q3EIuWMM6U6+si/V58RcH7FJKaImzM8VLzorOkI=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
