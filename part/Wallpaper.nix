{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/393/521/87/artistic-pixel-art-aircraft-airport-hd-wallpaper-c8661d782010dca8102cf14eb832349a.jpg";
	sha256 = "sha256-yyiLWLJJq1N0sTO3lDP1ze0XS8p9EW+c7CSQdP1m/vQ=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
