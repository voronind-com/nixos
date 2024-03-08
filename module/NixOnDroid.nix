{ pkgs, inputs, const, ... }: let
	homePath = "/data/data/com.termux.nix/files/home";
in {
	home-manager.config = {
		home.stateVersion = const.droidStateVersion;
		home.file = {
			".dotfiles".source   = inputs.self;
			".bash".source       = ./common/bash;
			".ssh/config".source = ./common/ssh/config;
		};
		home.sessionVariables = {
			BASH_PATH          = "${homePath}/.bash";
			NIX_CURRENT_SYSTEM = "${pkgs.stdenv.system}";
			TERM               = "xterm-256color";
		};
		programs.bash = {
			enable      = true;
			bashrcExtra = "source ${homePath}/.bash/Bashrc.sh";
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
		};
	};

	environment.packages = with pkgs; [
		android-tools
		binwalk
		coreutils
		curl
		diffutils
		ffmpeg
		file
		findutils
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
		ncdu
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
}
