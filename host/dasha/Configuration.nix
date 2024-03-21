{ lib, pkgs, ... }: {
	imports = [
		./Tablet.nix
	];

	environment.systemPackages = with pkgs; [
		networkmanager-l2tp
		gnome.networkmanager-l2tp
	];

	# Filesystems.
	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" ];
	};

	fileSystems."/storage/cold" = {
		device  = "/dev/storage/cold";
		fsType  = "ext4";
		options = [ "nofail" ];
	};
}
