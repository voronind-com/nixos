{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/500/198/463/pixel-art-digital-art-pixelated-pixels-wallpaper-b980f83df17add4b2677d8cf6091268d.jpg";
	sha256 = "sha256-OeHKf2fk4mqUvJTylYnR1uukzJJrKVpyhRjPY4om/K4=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
