{ pkgs, ... }: {
	# List of common packages I use.
	environment.systemPackages = with pkgs; [
		binwalk           # Can analyze files for other files inside them.
		btop htop         # System monitors.
		coreutils         # Common utilities.
		cryptsetup        # Filesystem encryption (LUKS).
		curl              # CLI http client.
		ddrescue testdisk # Apps to recover data from drives.
		diffutils         # Diff tool.
		dnsutils          # Dns utilities like host.
		exiftool          # Image info.
		fastfetch         # Systeminfo summary.
		ffmpeg            # Video/audio converter.
		file              # Get general info about a file.
		findutils         # Find tool.
		gcc               # C compiler.
		gdu               # TUI storage analyzer.
		git               # Version control system.
		gnumake gnused    # GNU utils.
		gparted parted    # GUI/CLI disk partition tool.
		imagemagick       # Image converter and transformation tool.
		inetutils         # Things like FTP.
		jq                # Json parser.
		lm_sensors        # Hardware sensors, like temperature and fan speeds.
		lshw              # Detailed hardware info tool.
		lsof              # Find current file users.
		ltex-ls           # Latex LSP for neovim spellcheck.
		man               # App to read manuals.
		nixd              # Nix LSP.
		nmap              # Network analyzer.
		parallel          # Run programs in parallel.
		pv                # IO progress bar.
		radare2           # Hex editor.
		ripgrep           # Grep for file search.
		rsync             # File copy tool.
		scanmem           # Memory edit tool.
		smartmontools     # S.M.A.R.T. tools.
		sqlite            # Serverless file-based database engine.
		tree              # Show directory stricture as a tree.
		usbutils          # Usb utilities like udiskctl.
		utillinux         # Common Linux utilities.
		ventoy            # Boot multiple ISO/images from a single USB stick.
		wget              # CLI http download tool.
		wireguard-tools   # Tools to work with Wireguard.
		yazi chafa        # CLI file manager.
		zip unzip         # Zip archive/unarchive tools.

		universal-android-debloater # Debloat Android devices.
	];

	# Special packages.
	programs = {
		adb.enable = true;
		java = {
			enable  = true;
			package = pkgs.corretto21;
		};
	};
	services = {
		udisks2.enable = true;
	};
}
