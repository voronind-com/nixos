{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/611/415/768/forest-pixel-art-wallpaper-2960a87db18add1bb637d87f20a1e6ed.jpg";
	sha256 = "sha256-sfi4hbpfi27SoOjDuEW5FXpuat51poQXawVFrni0z7w=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
