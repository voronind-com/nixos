{ pkgs, ... }: let
	url    = "https://4kwallpapers.com/images/wallpapers/boy-kid-alone-silhouette-moon-night-clouds-illustration-5846x4134-1017.jpg";
	sha256 = "sha256-MflCIvvK10vNoV6YN+I5cPKcKZLeIGYJIXePWjWSn8g=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
