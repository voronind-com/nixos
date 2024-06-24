{ lib, ... }: {
	imports = [
		./Filesystem.nix
	];

	# Disable docker service.
	systemd.services.docker-prune.enable = lib.mkForce false;
	systemd.services.docker.enable       = lib.mkForce false;
	systemd.sockets.docker.enable        = lib.mkForce false;
}
