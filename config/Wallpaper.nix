{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/2wJyF2y.png";
	sha256 = "0qqhcnd53vpf94gjqa2dq5zrq2hg8maxvl38l4r31g2rg18b9mxg";
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
