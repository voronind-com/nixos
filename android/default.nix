{ pkgs
, inputs
, const
, lib
, util
, config
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
	time.timeZone     = const.timeZone;
	nix.extraOptions  = "experimental-features = nix-command flakes";
	# stylix.autoEnable = lib.mkForce false;

	# Install packages.
	environment.packages = package.list;

	home-manager.config = {
		imports = [
			inputs.stylix.homeManagerModules.stylix
			# ../module/common/Stylix.nix
			# ../module/common/Wallpaper.nix
		];

		stylix = {
			enable     = true;
			image      = config.module.common.wallpaper.path;
			autoEnable = false;
			polarity   = "dark";
			opacity = {
				applications = 0.85;
				terminal     = 0.85;
				popups       = 0.85;
				desktop      = 0.85;
			};
			cursor = {
				name    = "Adwaita";
				package = pkgs.gnome3.adwaita-icon-theme;
				size    = 14;
			};
			fonts = let
				serif = {
					package = (pkgs.callPackage ../module/common/applefont {});
					name    = "SF Pro Display";
				};
			in {
				inherit serif;
				sizes = {
					applications = 12;
					terminal     = 14;
					popups       = 12;
					desktop      = 14;
				};
				sansSerif = serif;
				monospace = {
					package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
					name    = "Terminess Nerd Font Mono";
				};
				emoji = {
					package = pkgs.noto-fonts-emoji;
					name = "Noto Color Emoji";
				};
			};
			override = if config.module.common.wallpaper.forceContrastText then {
				base04 = "000000";
				base05 = "ffffff";
				base06 = "ffffff";
			} else {};
		};

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
			home-manager.enable = true;

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
