{ lib, ... }: {
	imports = [
		./Backup.nix
		./Container.nix
		./Filesystem.nix
		./Network.nix
		./Photoprocess.nix
	];

	# Disable auto-switch.
	systemd.services.autoupdate.enable = lib.mkForce false;
	systemd.timers.autoupdate.enable   = lib.mkForce false;
}
