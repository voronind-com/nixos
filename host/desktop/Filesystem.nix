{ ... }: {
	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "noatime" "nofail" ];
	};

	fileSystems."/storage/cold_1" = {
		device  = "/dev/storage/cold_1";
		fsType  = "ext4";
		options = [ "noatime" "noauto" "nofail" ];
	};

	fileSystems."/storage/cold_2" = {
		device  = "/dev/storage/cold_2";
		fsType  = "ext4";
		options = [ "noatime" "noauto" "nofail" ];
	};
}
