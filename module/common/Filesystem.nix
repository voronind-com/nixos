{ ... }: {
	fileSystems."/" = {
		device = "/dev/disk/by-partlabel/NIXROOT";
		fsType = "ext4";
	};
	fileSystems."/boot" = {
		device = "/dev/disk/by-partlabel/NIXBOOT";
		fsType = "vfat";
	};
}
