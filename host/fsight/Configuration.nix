{ lib, ... }: {
	imports = [ ];

	# Grub.
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

	# Root password.
	users.users.root.hashedPassword = lib.mkForce "$y$j9T$d4HfwutZr.eNHuLJYRuro/$7swZfgCNS6jEXHFCxsW5um/68jX9BRiiZD1BYcm/gD/";
}
