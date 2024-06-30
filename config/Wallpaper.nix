{ pkgs, lib, ... }: with lib; let
	url    = "https://i.postimg.cc/Q82Vg4z0/7680-Doom.jpg";
	sha256 = "sha256-GxPQzXlJFAl6VBhH+IoTdjwlOHMiUReu+dUdNcADN8Q=";
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
