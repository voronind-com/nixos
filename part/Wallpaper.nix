{ pkgs, ... }: let
	url    = "https://4kwallpapers.com/images/wallpapers/nezuko-kamado-demon-3840x2160-9331.jpg";
	sha256 = "sha256-EC8rVrb+ogD2iCCILKbkf8vWv2E8ZAFxjNHNHHeqo+4=";
in {
	path = pkgs.fetchurl {
		url    = url;
		sha256 = sha256;
	};
}
