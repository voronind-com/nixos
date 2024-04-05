{ pkgs, ... }: let
	url    = "https://i.imgur.com/ZcXlrK9.png";
	sha256 = "sha256-uh0GnrzjushvPmx75RIOzNC++5H1CNR5ZDm2lUWijYc=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
