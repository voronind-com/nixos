{ pkgs, lib, config, ... }: with lib; let
	url    = "https://i.imgur.com/0RldJsX.jpeg";
	sha256 = "sha256-hbbUz9+m/bLahDiflAoio6+4H0DHfxlbh92cWSjE4R4=";
	forceContrastText = false;
in {
	options = {
		module.common.wallpaper = {
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
