{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/GA96791.jpeg";
	sha256 = "sha256-fuTYdViuCT/OnGqQ1iuFygzS1ZfxG5w9TgT8cupgOgY=";
	forceContrastText = false;
in {
	options = {
		module.wallpaper = {
			forceContrastText = mkOption {
				default = forceContrastText;
				type    = types.bool;
			};
			path = mkOption {
				default = pkgs.fetchurl { inherit url sha256; };
				type    = types.path;
			};
		};
	};
}
