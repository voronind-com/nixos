{ lib, ... }: {
	imports = [
		./Filesystem.nix
		../dasha/Tablet.nix
	];

	# Disable keyd.
	services.keyd.enable = lib.mkForce false;
	systemd.services.keyd-application-mapper.enable = lib.mkForce false;
}
