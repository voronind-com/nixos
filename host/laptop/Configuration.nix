{ config, pkgs, environment, ... }: {
	imports = [ ];

	# Filesystems.
	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" ];
	};
}
