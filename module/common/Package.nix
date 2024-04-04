{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		binwalk
		btop
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
		udisks
		universal-android-debloater
		ventoy
		wget
		zip unzip
	];

	# Special packages.
	programs.adb.enable = true;
}
