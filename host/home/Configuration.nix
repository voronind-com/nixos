{ config, pkgs, lib, ... }: {
	imports = [
		./Backup.nix
		./Nextcloud.nix
		./PhotosProcess.nix
		./YandexMusic.nix
	];

	# Network.
	networking.networkmanager.insertNameservers = [
		"1.1.1.1"
		"8.8.8.8"
	];
	networking.extraHosts = ''
		10.1.0.2 git.voronind.com
		10.1.0.2 iot.voronind.com
		10.1.0.2 pass.voronind.com
	'';

	# Filesystems.
	fileSystems."/storage/cold_1" = {
		device  = "/dev/storage/cold_1";
		fsType  = "ext4";
		options = [ "nofail" ];
	};

	fileSystems."/storage/cold_2" = {
		device  = "/dev/storage/cold_2";
		fsType  = "ext4";
		options = [ "nofail" ];
	};

	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" ];
	};
}
