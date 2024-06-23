# I use the same layout on all hosts with GPT labels.
# This way I can configure system's FS in one place here.
{ ... }: {
	fileSystems."/" = {
		device  = "/dev/disk/by-partlabel/NIXROOT";
		fsType  = "ext4";
		options = [ "noatime" ];
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-partlabel/NIXBOOT";
		fsType = "vfat";
	};

	# /etc overlay.
	# boot.initrd.systemd.enable = true;
	# systemd.sysusers.enable    = true;
	# system.etc.overlay = {
	# 	enable  = true;
	# 	mutable = false;
	# };
}
