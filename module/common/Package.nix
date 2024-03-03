{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		appimage-run
		binwalk
		btop
		calibre
		coreutils
		cryptsetup
		curl
		ddrescue
		dxvk
		ffmpeg
		file
		gamescope
		gcc
		gnome.gnome-tweaks
		gnumake
		gnused
		imagemagick
		jdk
		jdk11
		jdk19
		jdk20
		jellyfin-media-player
		jq
		lm_sensors
		lshw
		lsof
		ltex-ls
		mangohud
		mpv
		ncdu
		nmap
		parallel
		parted
		pv
		ripgrep
		scanmem
		smartmontools
		sqlite
		steam-run
		testdisk
		tree
		universal-android-debloater
		ventoy
		vkd3d
		wget
		wine64
		wl-clipboard
		yt-dlp
		zip unzip
	];

	# Special packages.
	programs.adb.enable = true;
}
