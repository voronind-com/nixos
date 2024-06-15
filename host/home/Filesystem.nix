{ ... }: {
	fileSystems."/storage/cold_1" = {
		device  = "/dev/storage/cold_1";
		fsType  = "ext4";
		options = [ "nofail" "noatime" ];
	};

	fileSystems."/storage/cold_2" = {
		device  = "/dev/storage/cold_2";
		fsType  = "ext4";
		options = [ "nofail" "noatime" ];
	};

	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" "noatime" ];
	};

	swapDevices = [{
		device = "/var/lib/swapfile";
		size   = 128 * 1024;
	}];
}
