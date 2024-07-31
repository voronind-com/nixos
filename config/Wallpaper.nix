{ pkgs, lib, ... }: with lib; let
	url    = "https://i.imgur.com/4lqm0AZ.jpeg";
	sha256 = "1bkc2rm1jy0bva9z78rq9a5gchwa61ns1gn59kdp1k63brawhx62";
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
