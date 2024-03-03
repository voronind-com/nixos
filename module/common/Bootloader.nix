{ lib, ... }: {
	# Enable non-free firmware.
	hardware.enableRedistributableFirmware = lib.mkDefault true;

	# Configure bootloader.
	boot.loader.systemd-boot.enable      = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.configurationLimit = 7;
	boot.initrd.kernelModules          = [ "dm-snapshot" ];
	boot.initrd.availableKernelModules = [
		"ahci"
		"ata_piix"
		"mptspi"
		"nvme"
		"sd_mod"
		"sr_mod"
		"usb_storage"
		"usbhid"
		"xhci_pci"
	];
}
