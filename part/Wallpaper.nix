{ pkgs, ... }: let
	url    = "https://i.imgur.com/EjuHAgm.png";
	sha256 = "sha256-glQj8IfDvmZ+rI0cnHhvopVxWOxHZLiahDSt9zVUN/E=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
