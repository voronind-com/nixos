{ pkgs, ... }: {
	list = with pkgs; [
		android-tools
		binwalk
		coreutils diffutils findutils utillinux
		curl
		ffmpeg
		file
		gawk gnused gnugrep gnumake ripgrep
		gcc
		gdu
		git
		gnutar gzip xz
		hostname
		imagemagick
		jq
		lsof
		man
		nmap
		openssh
		parallel
		pv
		rsync
		sqlite
		pkgs.tmux
		tree
		wget
		yt-dlp
		zip unzip
	];
}
