{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/154/699/724/super-time-force-pixels-pixel-art-wallpaper-0f85e20caec63c8b759cb842a10114b4.jpg";
	sha256 = "sha256-w7n93e+Tz9t32raDWFtyPOuKfvy8d6X8Tq8bBZrQvqc=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
