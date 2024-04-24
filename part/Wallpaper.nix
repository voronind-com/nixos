{ pkgs, ... }: let
	url    = "https://r4.wallpaperflare.com/wallpaper/519/595/676/cyberpunk-video-games-pixel-art-the-last-night-wallpaper-9261d2d9e319dfea44788a19b8657ecf.jpg";
	sha256 = "sha256-ZKdV2eY+rDJZzG0JN8yMvnP2FiqGzvA8HKRqtA9Xnjs=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
