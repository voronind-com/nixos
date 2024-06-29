{ pkgs
, inputs
, const
, util
, secret
, ... } @args: let
	# Path where Termux stores user data.
	homePath = "/data/data/com.termux.nix/files/home";

	# Android modules.
	environment = import ./Environment.nix args;
	git         = import ./Git.nix         args;
	package     = import ./Package.nix     args;
	termux      = import ./Termux.nix      args;

	# External modules.
	bash = import ../module/common/bash args;
	nvim = import ../module/common/nvim args;
	ssh  = import ../module/common/ssh  args;
	tmux = import ../module/common/tmux args;
	yazi = import ../user/common/yazi args;
in {
	# Configure system.
	time.timeZone    = const.timeZone;
	nix.extraOptions = "experimental-features = nix-command flakes";

	# Install packages.
	environment.packages = package.list;

	home-manager.config = {
		home = {
			# Release version.
			stateVersion = const.droidStateVersion;

			# Environment variables.
			sessionVariables = environment.variables;

			# Where to put config files.
			file = {
				".dotfiles".source = inputs.self;
				".ssh/config".text = ssh.config;
				".termux/_font.ttf".source        = termux.font;
				".termux/_colors.properties".text = termux.colors;
				".config/yazi/init.lua".source    = yazi.init;
				".config/yazi/keymap.toml".source = yazi.keymap;
				".config/yazi/theme.toml".source  = yazi.theme;
				".config/yazi/yazi.toml".source   = yazi.yazi;
			};
		};

		# Special app configuration.
		programs = {
			bash = {
				enable = true;
				bashrcExtra = bash.config + termux.initScript;
			};

			tmux = {
				enable = true;
				extraConfig = tmux.config;
			};

			git = {
				enable = true;
				extraConfig = git.config;
			};

			neovim = {
				enable = true;
				extraConfig = nvim.config;
			};

			gpg = {
				enable = true;
				inherit (secret.crypto) publicKeys;
			};
		};
	};
}
