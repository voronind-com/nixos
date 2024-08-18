{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/5egkkvz.jpeg";
	sha256 = "02zjjpwnxvg8h9zz89i0n4a4raf6sd0r7liqmcxp25m1csixwbqv";
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
