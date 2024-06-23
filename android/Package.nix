{ pkgs, ... }: {
	list = with pkgs; [
		android-tools
		binwalk
		coreutils dnsutils diffutils findutils utillinux
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
		inetutils
		jq
		lsof
		man
		nmap
		openssh
		parallel
		tmux
		pv
		rsync
		sqlite
		tree
		wget
		yt-dlp
		yazi chafa
		zip unzip
	];
}
