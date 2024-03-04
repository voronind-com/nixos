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
			".nixos".source = inputs.dotfiles;
		};
		programs.bash = {
			enable = true;
			bashrcExtra = ''
				for module in ~/.nixos/module/common/bash/module/*.sh; do
					source ''${module}
				done
			'';
		};
	};
}
