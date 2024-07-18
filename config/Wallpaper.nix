{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/GTrVpFh.jpeg";
	sha256 = "1nn3ns14py4hf6ya50a84g0za4civd6mzg86a4z4k79sf7m23wza";
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
