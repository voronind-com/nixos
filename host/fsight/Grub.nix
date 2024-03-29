{ lib, ... }: {
	boot.loader.systemd-boot.enable      = lib.mkForce false;
	boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
	boot.loader.grub.enable      = true;
	boot.loader.grub.device      = "/dev/sda";
	boot.loader.grub.useOSProber = true;

	fileSystems."/" = lib.mkForce {
		device = "/dev/sda2";
		fsType = "ext4";
	};
	fileSystems."/boot" = lib.mkForce {
		device = "/dev/sda1";
		fsType = "vfat";
	};
}
