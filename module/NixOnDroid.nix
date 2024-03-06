{ pkgs, inputs, const, ... }: {
	environment.packages = with pkgs; [
		android-tools
		binwalk
		coreutils
		curl
		diffutils
		ffmpeg
		file
		findutils
		gcc
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
		ltex-ls
		man
		ncdu
		neovim
		nmap
		openssh
		parallel
		pv
		ripgrep
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
			".nixos".source      = inputs.self;
			".bash".source       = ./common/bash;
			".ssh/config".source = ./common/ssh/Config;
		};
		home.sessionVariables = {
			BASH_MODULE_PATH = "$HOME/.bash/module";
			BASH_PATH        = "$HOME/.bash";
		};
		programs.bash = {
			enable      = true;
			bashrcExtra = "source ~/.bash/Bashrc.sh";
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
	};
}
