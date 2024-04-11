{ ... }: {
	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" "noatime" ];
	};

	fileSystems."/storage/cold" = {
		device  = "/dev/storage/cold";
		fsType  = "ext4";
		options = [ "nofail" "noatime" ];
	};
}
