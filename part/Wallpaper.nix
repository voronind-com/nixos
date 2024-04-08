{ pkgs, ... }: let
	url    = "https://images.unsplash.com/photo-1542401886-65d6c61db217";
	sha256 = "sha256-iSDB8YqemQUwJ8Fe8jh5nyWXtXkB02z+zOl+YmIWSkE=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
