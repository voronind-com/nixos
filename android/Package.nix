{ pkgs, ... }: {
	list = with pkgs; [
		android-tools   # Android adb tool. Can be used to connect to itself via wireless debugging.
		binwalk         # Can analyze files for other files inside them.
		curl            # CLI http client.
		exiftool        # Image info.
		ffmpeg          # Video/audio converter.
		file            # Get general info about a file.
		gdu             # TUI storage analyzer.
		git             # Version control system.
		gnutar gzip xz  # Archive and compression tools.
		imagemagick     # Image converter and transformation tool.
		inetutils       # Things like FTP.
		jq              # Json parser.
		lsof            # Find current file users.
		man             # App to read manuals.
		neovim gcc      # CLI text editor.
		nmap            # Network analyzer.
		openssh         # Ssh client.
		parallel        # Run programs in parallel.
		pv              # IO progress bar.
		ripgrep         # Grep for file search.
		rsync           # File copy tool.
		sqlite          # Serverless file-based database engine.
		tmux            # Terminal multiplexor.
		tree            # Show directory stricture as a tree.
		wget            # CLI http download tool.
		wireguard-tools # Tools to work with Wireguard.
		yazi chafa      # CLI file manager.
		yt-dlp          # Video downloader.
		zip unzip       # Zip archive/unarchive tools.

		coreutils dnsutils diffutils findutils utillinux # Common utilities.
		gawk gnused gnugrep gnumake ripgrep              # Common Gnu utils.
	];
}
