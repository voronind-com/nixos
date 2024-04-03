{ pkgs, inputs, const, config, ... }: let
	homePath   = "/data/data/com.termux.nix/files/home";
	tmuxScript = pkgs.writeShellScriptBin "tmux_script" (builtins.readFile ./common/tmux/Script.sh);
	bash       = import ./common/bash/Bash.nix { config = config; };
	bg = config.lib.stylix.colors.base00;
	fg = config.lib.stylix.colors.base04;
in {
	# NOTE: Split into modules?
	environment.packages = with pkgs; [
		android-tools
		binwalk
		coreutils
		curl
		diffutils
		ffmpeg
		file
		findutils
		gawk
		gcc
		gdu
		git
		gnugrep
		gnumake
		gnused
		gnutar
		gzip
		hostname
		imagemagick
		jq
		lsof
		man
		neofetch
		nmap
		openssh
		parallel
		pv
		ripgrep
		rsync
		sqlite
		tmux tmuxScript
		tree
		utillinux
		wget
		xz
		yt-dlp
		zip unzip
	];

	time.timeZone = const.timeZone;
	nix.extraOptions = ''
		experimental-features = nix-command flakes
	'';

	home-manager.config = {
		home.stateVersion = const.droidStateVersion;
		home.file = {
			".dotfiles".source   = inputs.self;
			".ssh/config".source = ./common/ssh/config;
			".termux/_font.ttf".source = pkgs.runCommandNoCC "font" {} ''
				cp ${pkgs.nerdfonts.override { fonts = [ "Terminus" ]; }}/share/fonts/truetype/NerdFonts/TerminessNerdFontMono-Regular.ttf $out
			'';
			".termux/_colors.properties".text = ''
				background=#${bg}
				foreground=#${fg}
			'';
		};
		home.sessionVariables = {
			BASH_PATH            = ./common/bash;
			EDITOR               = "nvim";
			MANPAGER             = "nvim +Man!";
			NIXPKGS_ALLOW_UNFREE = "1";
			NIX_CURRENT_SYSTEM   = "${pkgs.stdenv.system}";
			TERM                 = "xterm-256color";
		};
		programs.bash = {
			enable = true;
			bashrcExtra = bash.config + ''
				[[ -f ~/.termux/font.ttf ]] || {
					cp ~/.termux/_font.ttf ~/.termux/font.ttf
					# cp ~/.termux/_colors.properties ~/.termux/colors.properties
					_warn "Termux config installed, please restart."
				};
			'';
		};
		programs.tmux = {
			enable = true;
			extraConfig = builtins.readFile ./common/tmux/tmux.conf;
		};
		programs.git = {
			enable = true;
			extraConfig = {
				credential.helper    = "store";
				init.defaultBranch   = "main";
				pull.rebase          = true;
				push.autoSetupRemote = true;
				rebase.autoStash     = true;
			};
		};
		programs.neovim = {
			enable   = true;
			viAlias  = true;
			vimAlias = true;
			extraConfig = (import ./common/nvim/Init.nix { inputs = inputs; }).customRc;
		};

		stylix = {
			image = wallpaper.path;
			autoEnable = true;
			polarity = "dark";
			# base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
			opacity = {
				applications = 0.85;
				terminal     = 0.85;
				popups       = 0.85;
				desktop      = 0.85;
			};
			cursor = {
				name    = "phinger-cursors";
				package = pkgs.phinger-cursors;
				size    = 24;
			};
			fonts = {
				sizes = {
					applications = 12;
					terminal     = 12;
					popups       = 12;
					desktop      = 12;
				};
				serif = {
					package = (pkgs.callPackage ./applefont {});
					name    = "SF Pro Display";
				};
				sansSerif = config.stylix.fonts.serif;
				monospace = {
					package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
					name    = "Terminess Nerd Font Mono";
				};
				emoji = {
					package = pkgs.noto-fonts-emoji;
					name = "Noto Color Emoji";
				};
			};
			# targets = {
			# 	foot = {
			# 		enable = true;
			# 	};
			# };
		};
	};
}
