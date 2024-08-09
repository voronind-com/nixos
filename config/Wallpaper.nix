{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/e94Lz8h.png";
	sha256 = "0ndqh7xx7dqjlb21cp5zv99g7scdfqcaivbmsbg0jdbj9q4bqpab";
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
