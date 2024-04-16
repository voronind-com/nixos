{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/1024/884/847/waneella-pixel-art-city-plants-hd-wallpaper-cffe8c9aa7605f8ab4ba9c6980e5fbe4.jpg";
	sha256 = "sha256-a3cvyt7AuBZ2zUMMzgKAkLvjXyHZ4AkT8N6FrGMuxYk=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
