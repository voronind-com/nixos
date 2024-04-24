{ lib, ... }: {
	imports = [
		./Filesystem.nix
		./Tablet.nix
		./Vpn.nix
	];

	# Disable keyd.
	services.keyd.enable = lib.mkForce false;
	systemd.services.keyd-application-mapper.enable = lib.mkForce false;
}
