{ pkgs, inputs, const, ... }: let
	homePath = "/data/data/com.termux.nix/files/home";
	tmuxScript = pkgs.writeShellScriptBin "tmux_script" (builtins.readFile ./common/tmux/Script.sh);
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
			# ".termux/_colors.properties".text = ''
			# 	background=#${bg}
			# 	foreground=#${fg}
			# '';
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
			bashrcExtra = ''
				source $BASH_PATH/Bashrc.sh
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
	};
}
