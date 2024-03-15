{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		# yt-dlp
		appimage-run
		binwalk
		btop
		calibre
		coreutils
		cryptsetup
		curl
		ddrescue
		ffmpeg
		file
		gamescope
		gcc
		gdu
		gnome.gnome-tweaks
		gnumake
		gnused
		imagemagick
		jdk jdk11 jdk19 jdk20
		jellyfin-media-player
		jq
		lm_sensors
		lshw
		lsof
		ltex-ls
		mangohud
		mpv
		neofetch
		networkmanager_strongswan
		nmap
		parallel
		parted
		pv
		ripgrep
		scanmem
		smartmontools
		sqlite
		steam-run
		strongswan
		strongswanNM
		testdisk
		tree
		universal-android-debloater
		ventoy
		wget
		wine64 dxvk vkd3d
		wl-clipboard
		zip unzip
	];

	# Special packages.
	programs.adb.enable = true;
}
