{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		binwalk
		btop htop
		coreutils
		cryptsetup
		curl
		ddrescue testdisk
		ffmpeg
		file
		gcc
		gdu
		gnumake
		gnused
		gparted
		imagemagick
		jdk jdk11 jdk19 jdk20
		jq
		lm_sensors
		lshw
		lsof
		ltex-ls
		neofetch
		nixd
		nmap
		parallel
		parted
		pv
		ripgrep
		scanmem
		smartmontools
		sqlite
		tree
		universal-android-debloater
		usbutils
		ventoy
		wget
		zip unzip
	];

	# Special packages.
	programs.adb.enable     = true;
	services.udisks2.enable = true;
}
