{ pkgs, inputs, const, style, util, key, setting, secret, ... } @args: let
	homePath   = "/data/data/com.termux.nix/files/home";
	tmux       = import ./common/tmux args;
	tmuxScript = pkgs.writeShellScriptBin "tmux_script" tmux.script;
	bash       = import ./common/bash args;
	nvim       = import ./common/nvim args;
	ssh        = import ./common/ssh  args;
	font = pkgs.runCommandNoCC "font" {} ''
		cp ${pkgs.nerdfonts.override { fonts = [ "Terminus" ]; }}/share/fonts/truetype/NerdFonts/TerminessNerdFontMono-Regular.ttf $out
	'';
	colors = ''
		background=#${style.color.bg.dark}
		foreground=#${style.color.fg.light}
	'';
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
		pkgs.tmux tmuxScript
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
		home = {
			stateVersion = const.droidStateVersion;
			file = {
				".dotfiles".source = inputs.self;
				".ssh/config".text = ssh.config;
				".termux/_font.ttf".source = font;
				".termux/_colors.properties".text = colors;
			};
			sessionVariables = {
				EDITOR               = "nvim";
				MANPAGER             = "nvim +Man!";
				NIXPKGS_ALLOW_UNFREE = "1";
				NIX_CURRENT_SYSTEM   = "${pkgs.stdenv.system}";
				TERM                 = "xterm-256color";
			};
		};

		programs = {
			bash = {
				enable = true;
				bashrcExtra = bash.config + ''
					[[ -f ~/.termux/font.ttf ]] || {
						cp ~/.termux/_font.ttf ~/.termux/font.ttf
						cp ~/.termux/_colors.properties ~/.termux/colors.properties
						_warn "Termux config installed, please restart."
					};
				'';
			};

			tmux = {
				enable = true;
				extraConfig = tmux.config;
			};

			git = {
				enable = true;
				extraConfig = {
					credential.helper    = "store";
					init.defaultBranch   = "main";
					pull.rebase          = true;
					push.autoSetupRemote = true;
					rebase.autoStash     = true;
				};
			};

			neovim = {
				enable   = true;
				viAlias  = true;
				vimAlias = true;
				extraConfig = nvim.config;
			};

			gpg = {
				enable     = true;
				publicKeys = secret.crypto.publicKeys;
			};
		};
	};
}
