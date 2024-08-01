{ pkgs, pkgsStable, pkgsMaster, ... } @args: {
	core = with pkgs; [
		android-tools     # Android adb tool. Can be used to connect to itself via wireless debugging.
		binwalk           # Can analyze files for other files inside them.
		btop htop         # System monitors.
		cryptsetup        # Filesystem encryption (LUKS).
		curl              # CLI http client.
		ddrescue testdisk # Apps to recover data from drives.
		exiftool          # Image info.
		fastfetch         # Systeminfo summary.
		ffmpeg            # Video/audio converter.
		file              # Get general info about a file.
		gcc               # C compiler.
		gdu               # TUI storage analyzer.
		git               # Version control system.
		gnutar gzip xz    # Archive and compression tools.
		gparted parted    # GUI/CLI disk partition tool.
		imagemagick       # Image converter and transformation tool.
		inetutils         # Things like FTP.
		jq                # Json parser.
		lm_sensors        # Hardware sensors, like temperature and fan speeds.
		lshw              # Detailed hardware info tool.
		lsof              # Find current file users.
		ltex-ls           # Latex LSP for neovim spellcheck.
		man               # App to read manuals.
		neovim            # Text editor.
		nixd              # Nix LSP.
		nmap              # Network analyzer.
		ollama            # LLMs.
		openssh sshfs     # Ssh client.
		parallel          # Run programs in parallel.
		pv                # IO progress bar.
		radare2           # Hex editor.
		ripgrep           # Grep for file search.
		rsync             # File copy tool.
		scanmem           # Memory edit tool.
		smartmontools     # S.M.A.R.T. tools.
		sqlite            # Serverless file-based database engine.
		tmux              # Terminal multiplexor.
		tree              # Show directory stricture as a tree.
		usbutils          # Usb utilities like udiskctl.
		utillinux         # Common Linux utilities.
		ventoy            # Boot multiple ISO/images from a single USB stick.
		wget              # CLI http download tool.
		wireguard-tools   # Tools to work with Wireguard.
		yazi chafa        # CLI file manager.
		zapret            # FRKN.
		zip unzip         # Zip archive/unarchive tools.

		coreutils dnsutils diffutils findutils utillinux # Common utilities.
		gawk gnused gnugrep gnumake ripgrep              # Common Gnu utils.

		(pkgs.callPackage ./apks {})
		(pkgs.callPackage ./yamusicdownload {})
		# (pkgs.callPackage ./ytdlp {})
		yt-dlp
	];

	desktop = with pkgs; [
		foot                           # Terminal emulator.
		fuzzel                         # Application launcher.
		grim slurp                     # Screenshot.
		mako                           # Notification system.
		networkmanagerapplet           # Internet configuration.
		pamixer pavucontrol pulseaudio # Audio.
		playerctl                      # Multimedia controls.
		sway waybar                    # Sway WM.

		(pkgs.callPackage ./swayscript args)
	];

	common = with pkgs; [
		adwaita-icon-theme    # GTK icons.
		evince                # Document viewer.
		firefox-esr           # Web browser.
		gimp                  # Image manipulation program.
		gnome-calculator      # Calculator.
		nautilus              # File manager.
		jellyfin-media-player # Jellyfin client (self-hosted Netflix).
		loupe                 # Image viewer.
		obs-studio            # Streaming/recording app.
		onlyoffice-bin        # Office documents app suite.

		(mpv.override {scripts = [mpvScripts.mpris];}) # Media player.
	];

	gaming = with pkgs; [
		steam-run # Run games outside of Steam.
		steam bottles dxvk gamescope mangohud vkd3d wine64 # Gaming!
	];

	creative = with pkgs; [
		aseprite    # Pixel Art draw app. WARNING: Always builds from source.
		blender-hip # Blender with HiP support.
		krita       # Draw!
	];

	dev = with pkgs; [
		android-studio
		jetbrains.idea-community
	];

	extra = with pkgs; [
		anilibria-winmaclinux       # Anime!
		appimage-run                # Tool to run .AppImage files in NixOS.
		blanket                     # Sounds generator.
		calibre                     # Book library manager.
		gnome-font-viewer           # Font viewer.
		tor-browser                 # Privacy browser.
		universal-android-debloater # Debloat Android devices.
	];
}
