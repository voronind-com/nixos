{
	inputs = {
		# System.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		stylix.url  = "github:danth/stylix";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

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
			droidStateVersion = "22.11";
			stateVersion      = "23.11";
			timeZone = "Europe/Moscow";
			url = "https://git.voronind.com/voronind/nixos.git";
		};

		# Common modules used across all hosts.
		nixosModules.common = let
			ls = path: map (f: "${path}/${f}") (builtins.filter (i: builtins.readFileType "${path}/${i}" == "regular") (builtins.attrNames (builtins.readDir path)));
		in {
			imports = (ls ./module/common) ++ [
				./user/Root.nix
			];
		};

		# Function to create a host.
		mkHost = { system, hostname, modules } @args: nixpkgs.lib.nixosSystem {
			inherit system;

			modules = [
				./host/${hostname}/Configuration.nix
				{ networking.hostName = hostname; }
				{ system.stateVersion = self.nixosModules.const.stateVersion; }
				inputs.self.nixosModules.common
				home-manager.nixosModules.home-manager
				stylix.nixosModules.stylix
			] ++ modules;

			specialArgs = let
				pkgs   = nixpkgs.legacyPackages.${system}.pkgs;
				config = self.nixosConfigurations.${hostname}.config;
			in {
				const     = self.nixosModules.const;
				flake     = self;
				inputs    = inputs;
				key       = import ./part/Key.nix       {};
				secret    = import ./part/Secret.nix    {};
				setting   = import ./part/Setting.nix   {};
				style     = import ./part/Style.nix     { config = config; };
				util      = import ./part/Util.nix      { pkgs   = pkgs;   };
				wallpaper = import ./part/Wallpaper.nix { pkgs   = pkgs;   };
			};
		};

		# List of all hosts bellow.
		nixosConfigurations.basic = self.mkHost {
			hostname = "basic";
			system   = "x86_64-linux";
			modules = [
				({ pkgs, ... }: { boot.kernelPackages = nixpkgs.lib.mkForce pkgs.linuxPackages; })
			];
		};

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

			extraSpecialArgs = let
				pkgs = nixpkgs.legacyPackages."aarch64-linux".pkgs;
			in {
				const   = self.nixosModules.const;
				flake   = self;
				inputs  = inputs;
				key     = import ./part/Key.nix     {};
				secret  = import ./part/Secret.nix  {};
				setting = import ./part/Setting.nix {};
				style   = import ./part/Style.nix   { config = import ./part/style/Gruvbox.nix {}; };
				util    = import ./part/Util.nix    { pkgs   = pkgs;  };
			};
		};
	};
}
