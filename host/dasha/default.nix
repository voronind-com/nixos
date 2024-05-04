{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	# Disable keyd.
	services.keyd.enable = lib.mkForce false;
	systemd.services.keyd-application-mapper.enable = lib.mkForce false;
}
