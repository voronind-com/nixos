{ pkgs, inputs, const, ... }: let
	homePath = "/data/data/com.termux.nix/files/home";
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
		rsync
		sqlite
		tmux
		tree
		utillinux
		wget
		xz
		yt-dlp
		zip unzip
	];

	home-manager.config = {
		home.stateVersion = const.droidStateVersion;
		home.file = {
			".dotfiles".source        = inputs.self;
			".ssh/config".source      = ./common/ssh/config;
			".termux/font.ttf_".source = pkgs.runCommandNoCC "font" {} ''
				cp ${pkgs.nerdfonts.override { fonts = [ "Terminus" ]; }}/share/fonts/truetype/NerdFonts/TerminessNerdFontMono-Regular.ttf $out
			'';
		};
		home.sessionVariables = {
			BASH_PATH          = ./common/bash;
			EDITOR             = "nvim";
			MANPAGER           = "nvim +Man!";
			NIX_CURRENT_SYSTEM = "${pkgs.stdenv.system}";
			TERM               = "xterm-256color";
		};
		programs.bash = {
			enable      = true;
			bashrcExtra = "source $BASH_PATH/Bashrc.sh";
		};
		programs.tmux = {
			enable      = true;
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
