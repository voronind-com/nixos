{ pkgs, inputs, const, style, util, key, setting, secret, ... } @args: let
	# Path where Termux stores user data.
	homePath = "/data/data/com.termux.nix/files/home";

	# Android modules.
	environment = import ./Environment.nix args;
	git         = import ./Git.nix         args;
	nix         = import ./Nix.nix         args;
	package     = import ./Package.nix     args;
	termux      = import ./Termux.nix      args;

	# External modules.
	bash = import ../common/bash args;
	nvim = import ../common/nvim args;
	ssh  = import ../common/ssh  args;
	tmux = import ../common/tmux args;
	yazi = import ../../user/common/yazi args;
in {
	time.timeZone    = const.timeZone;
	nix.extraOptions = nix.extraOptions;

	environment.packages = package.list;

	home-manager.config = {
		home = {
			stateVersion     = const.droidStateVersion;
			sessionVariables = environment.variables;
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
				publicKeys = secret.crypto.publicKeys;
			};
		};
	};
}
