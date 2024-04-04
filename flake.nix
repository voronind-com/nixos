{
	inputs = {
		# System.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix.url = "github:danth/stylix";

		# Android.
		nix-on-droid = {
			url = "github:t184256/nix-on-droid/release-23.05";
			inputs.nixpkgs.follows      = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};

		# Nvim plugins.
		nvimAlign = {
			url   = "github:echasnovski/mini.align";
			flake = false;
		};
		nvimAutoclose = {
			url   = "github:m4xshen/autoclose.nvim";
			flake = false;
		};
		nvimBufferline = {
			url   = "github:akinsho/bufferline.nvim";
			flake = false;
		};
		nvimCloseBuffers = {
			url   = "github:kazhala/close-buffers.nvim";
			flake = false;
		};
		nvimColorizer = {
			url   = "github:brenoprata10/nvim-highlight-colors";
			flake = false;
		};
		nvimDevicons = {
			url   = "github:nvim-tree/nvim-web-devicons";
			flake = false;
		};
		nvimGitsigns = {
			url   = "github:lewis6991/gitsigns.nvim";
			flake = false;
		};
		nvimGruvboxMaterial = {
			url   = "github:sainnhe/gruvbox-material";
			flake = false;
		};
		nvimIndentoMatic = {
			url   = "github:Darazaki/indent-o-matic";
			flake = false;
		};
		nvimLspconfig = {
			url   = "github:neovim/nvim-lspconfig";
			flake = false;
		};
		nvimOllama = {
			url   = "github:nomnivore/ollama.nvim";
			flake = false;
		};
		nvimPlenary = {
			url   = "github:nvim-lua/plenary.nvim";
			flake = false;
		};
		nvimSingleComment = {
			url   = "github:LucasTavaresA/singlecomment.nvim";
			flake = false;
		};
		nvimTelescope = {
			url   = "github:nvim-telescope/telescope.nvim";
			flake = false;
		};
		nvimTodo = {
			url   = "github:folke/todo-comments.nvim";
			flake = false;
		};
		nvimTokyonight = {
			url   = "github:folke/tokyonight.nvim";
			flake = false;
		};
		nvimTree = {
			url   = "github:nvim-tree/nvim-tree.lua";
			flake = false;
		};
		nvimTreesitter = {
			url   = "github:nvim-treesitter/nvim-treesitter";
			flake = false;
		};
		nvimTrouble = {
			url   = "github:folke/trouble.nvim";
			flake = false;
		};
		nvimWhichKey = {
			url   = "github:folke/which-key.nvim";
			flake = false;
		};
	};

	outputs = { self, nixpkgs, nix-on-droid, home-manager, stylix, ... } @inputs: {
		# Constant values.
		nixosModules.const = {
			url = "git+https://git.voronind.com/voronind/nixos.git";
			hashedPassword = "$y$j9T$oqCB16i5E2t1t/HAWaFd5.$tTaHtAcifXaDVpTcRv.yH2/eWKxKE9xM8KcqXHfHrD7"; # Use `mkpasswd`.
			droidStateVersion = "22.11";
			stateVersion      = "23.11";
			timeZone = "Europe/Moscow";
		};

		# Styles.
		style = { config, ... }: {
			color = {
				accent      = config.lib.stylix.colors.base0A;
				bg          = config.lib.stylix.colors.base01;
				bg_dark     = config.lib.stylix.colors.base00;
				bg_light    = config.lib.stylix.colors.base07;
				fg          = config.lib.stylix.colors.base05;
				fg_dark     = config.lib.stylix.colors.base04;
				fg_light    = config.lib.stylix.colors.base06;
				heading     = config.lib.stylix.colors.base0D;
				hl          = config.lib.stylix.colors.base03;
				keyword     = config.lib.stylix.colors.base0E;
				link        = config.lib.stylix.colors.base09;
				misc        = config.lib.stylix.colors.base0F;
				negative    = config.lib.stylix.colors.base08;
				neutral     = config.lib.stylix.colors.base0C;
				positive    = config.lib.stylix.colors.base0B;
				selection   = config.lib.stylix.colors.base02;
				transparent = "ffffff00";

				accent-b   = config.lib.stylix.colors.base0A-rgb-b;
				accent-g   = config.lib.stylix.colors.base0A-rgb-g;
				accent-r   = config.lib.stylix.colors.base0A-rgb-r;
				negative-b = config.lib.stylix.colors.base08-rgb-b;
				negative-g = config.lib.stylix.colors.base08-rgb-g;
				negative-r = config.lib.stylix.colors.base08-rgb-r;
				neutral-b  = config.lib.stylix.colors.base0C-rgb-b;
				neutral-g  = config.lib.stylix.colors.base0C-rgb-g;
				neutral-r  = config.lib.stylix.colors.base0C-rgb-r;
				positive-b = config.lib.stylix.colors.base0B-rgb-b;
				positive-g = config.lib.stylix.colors.base0B-rgb-g;
				positive-r = config.lib.stylix.colors.base0B-rgb-r;
			};
			font = {
				emoji.name     = config.stylix.fonts.emoji.name;
				monospace.name = config.stylix.fonts.monospace.name;
				sansSerif.name = config.stylix.fonts.sansSerif.name;
				serif.name     = config.stylix.fonts.serif.name;
				size = {
					terminal    = config.stylix.fonts.sizes.terminal;
					popup       = config.stylix.fonts.sizes.popups;
					application = config.stylix.fonts.sizes.applications;
					desktop     = config.stylix.fonts.sizes.desktop;
				};
			};
			opacity = {
				application = config.stylix.opacity.applications;
				desktop     = config.stylix.opacity.desktop;
				popup       = config.stylix.opacity.popups;
				terminal    = config.stylix.opacity.terminal;
			};
		};

		defaultStyle = {
			lib.stylix.colors = {
				accent      = "b8bb26";
				bg          = "3c3836";
				bg_dark     = "1d2021";
				bg_light    = "504945";
				fg          = "ebdbb2";
				fg_dark     = "a89984";
				fg_light    = "fbf1c7";
				heading     = "d5c4a1";
				hl          = "98971a";
				keyword     = "98971a";
				link        = "076678";
				misc        = "808080";
				negative    = "cc241d";
				neutral     = "458588";
				positive    = "87af87";
				selection   = "87af87";

				accent-b   = "38";
				accent-g   = "187";
				accent-r   = "184";
				negative-b = "29";
				negative-g = "36";
				negative-r = "204";
				neutral-b  = "136";
				neutral-g  = "133";
				neutral-r  = "69";
				positive-b = "135";
				positive-g = "175";
				positive-r = "135";
			};
			stylix = {
				fonts = {
					monospace.name = "Terminess Nerd Font Mono";
					emoji.name     = "Noto Color Emoji";
					sans.name      = "SF Pro Display";
					sansSerif.name = "SF Pro Display";
					sizes = {
						applications = 12;
						terminal     = 12;
						popups       = 12;
						desktop      = 12;
					};
				};
				opacity = {
					application = 1.0;
					desktop     = 1.0;
					popup       = 1.0;
					terminal    = 1.0;
				};
			};
		};

		# Wallpaper.
		wallpaper = { pkgs, ... }: let
			url    = "https://4kwallpapers.com/images/wallpapers/tuscany-pixel-art-3840x2160-15225.jpg";
			sha256 = "sha256-kc87Q3EIuWMM6U6+si/V58RcH7FJKaImzM8VLzorOkI=";
		in {
			path = pkgs.fetchurl {
				url    = url;
				sha256 = sha256;
			};
		};

		# Common modules used across all hosts.
		nixosModules.common.imports = [
			./module/common/AutoUpdate.nix
			./module/common/Bash.nix
			./module/common/Bootloader.nix
			./module/common/Distrobox.nix
			./module/common/Dotfiles.nix
			./module/common/Filesystem.nix
			./module/common/Firefox.nix
			./module/common/Firewall.nix
			./module/common/Font.nix
			./module/common/Git.nix
			./module/common/Kernel.nix
			./module/common/Ld.nix
			./module/common/Locale.nix
			./module/common/Network.nix
			./module/common/Nix.nix
			./module/common/Nvim.nix
			./module/common/Package.nix
			./module/common/Ssh.nix
			./module/common/Sshd.nix
			./module/common/Stylix.nix
			./module/common/Swap.nix
			./module/common/Tmux.nix
			./module/common/Users.nix
			./module/common/YtDlp.nix
			./user/Root.nix
		];

		# Function to create a host.
		mkHost = { system, hostname, modules }: nixpkgs.lib.nixosSystem {
			inherit system;

			modules = [
				./host/${hostname}/Configuration.nix
				{ networking.hostName = hostname; }
				{ system.stateVersion = self.nixosModules.const.stateVersion; }
				inputs.self.nixosModules.common
				home-manager.nixosModules.home-manager
				stylix.nixosModules.stylix
			] ++ modules;

			specialArgs = {
				const     = self.nixosModules.const;
				flake     = self;
				inputs    = inputs;
				style     = self.style     { config = self.nixosConfigurations.${hostname}.config; };
				wallpaper = self.wallpaper { pkgs   = nixpkgs.legacyPackages.${system}.pkgs;       };
			};
		};

		# List of all hosts bellow.
		nixosConfigurations.dasha = self.mkHost {
			hostname = "dasha";
			system   = "x86_64-linux";
			modules = [
				./module/AmdGpu.nix
				./module/Gnome.nix
				./module/IntelCpu.nix
				./module/PowersaveIntel.nix
				./module/Print.nix
				./module/RemoteBuild.nix
				./user/Dasha.nix
			];
		};

		nixosConfigurations.desktop = self.mkHost {
			hostname = "desktop";
			system   = "x86_64-linux";
			modules = [
				./module/AmdCompute.nix
				./module/AmdCpu.nix
				./module/AmdGpu.nix
				./module/Ollama.nix
				./module/PowersaveAmd.nix
				./module/Print.nix
				./module/RemoteBuild.nix
				./module/Sway.nix
				./module/VirtManager.nix
				./user/Voronind.nix
			];
		};

		nixosConfigurations.fsight = self.mkHost {
			hostname = "fsight";
			system   = "x86_64-linux";
			modules = [
				./module/Docker.nix
			];
		};

		nixosConfigurations.home = self.mkHost {
			hostname = "home";
			system   = "x86_64-linux";
			modules = [
				./module/AmdCpu.nix
				./module/AmdGpu.nix
				./module/Docker.nix
				./module/Ftpd.nix
				./module/RemoteBuilder.nix
				./module/Sway.nix
				./user/Voronind.nix
			];
		};

		nixosConfigurations.laptop = self.mkHost {
			hostname = "laptop";
			system   = "x86_64-linux";
			modules = [
				./module/AmdCpu.nix
				./module/AmdGpu.nix
				./module/Gnome.nix
				./module/Ollama.nix
				./module/PowersaveAmd.nix
				./module/Print.nix
				./module/RemoteBuild.nix
				./user/Dasha.nix
				./user/Voronind.nix
			];
		};

		nixosConfigurations.live = self.mkHost {
			hostname = "live";
			system   = "x86_64-linux";
			modules = [
				"${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
				"${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
				{ networking.wireless.enable                       = nixpkgs.lib.mkForce false; }
				{ services.openssh.settings.PasswordAuthentication = nixpkgs.lib.mkForce true; }
				{ services.openssh.settings.PermitRootLogin        = nixpkgs.lib.mkForce "yes"; }
				{ system.autoUpgrade.enable                        = nixpkgs.lib.mkForce false; }
				({ pkgs, ... }: { boot.kernelPackages              = nixpkgs.lib.mkForce pkgs.linuxPackages; })
			];
		};

		nixosConfigurations.work = self.mkHost {
			hostname = "work";
			system   = "x86_64-linux";
			modules = [
				./module/IntelCpu.nix
				./module/Ollama.nix
				./module/Powerlimit.nix
				./module/PowersaveIntel.nix
				./module/Print.nix
				./module/RemoteBuild.nix
				./module/Sway.nix
				./user/Voronind.nix
			];
		};

		# Android.
		nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
			modules = [
				{ system.stateVersion = inputs.self.nixosModules.const.droidStateVersion; }
				./module/NixOnDroid.nix
			];
			extraSpecialArgs = {
				const  = self.nixosModules.const;
				flake  = self;
				inputs = inputs;
				style  = self.style { config = self.defaultStyle; };
			};
		};
	};
}
