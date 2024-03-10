{
	inputs = {
		# System.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
			url   = "git+https://git.voronind.com/mirror/mini.align.git";
			flake = false;
		};
		nvimAutoclose = {
			url   = "git+https://git.voronind.com/mirror/autoclose.nvim.git";
			flake = false;
		};
		nvimBufferline = {
			url   = "git+https://git.voronind.com/mirror/bufferline.nvim.git";
			flake = false;
		};
		nvimCloseBuffers = {
			url   = "git+https://git.voronind.com/mirror/close-buffers.nvim.git";
			flake = false;
		};
		nvimDevicons = {
			url   = "git+https://git.voronind.com/mirror/nvim-web-devicons.git";
			flake = false;
		};
		nvimGitsigns = {
			url   = "git+https://git.voronind.com/mirror/gitsigns.nvim.git";
			flake = false;
		};
		nvimGruvboxMaterial = {
			url   = "git+https://git.voronind.com/mirror/gruvbox-material.git";
			flake = false;
		};
		nvimIndentoMatic = {
			url   = "git+https://git.voronind.com/mirror/indent-o-matic.git";
			flake = false;
		};
		nvimLspconfig = {
			url   = "git+https://git.voronind.com/mirror/nvim-lspconfig.git";
			flake = false;
		};
		nvimLualine = {
			url   = "git+https://git.voronind.com/mirror/lualine.nvim.git";
			flake = false;
		};
		nvimOllama = {
			url   = "git+https://git.voronind.com/mirror/ollama.nvim.git";
			flake = false;
		};
		nvimPlenary = {
			url   = "git+https://git.voronind.com/mirror/plenary.nvim.git";
			flake = false;
		};
		nvimSingleComment = {
			url   = "git+https://git.voronind.com/mirror/SingleComment.nvim.git";
			flake = false;
		};
		nvimTelescope = {
			url   = "git+https://git.voronind.com/mirror/telescope.nvim.git";
			flake = false;
		};
		nvimTodo = {
			url   = "git+https://git.voronind.com/mirror/todo-comments.nvim.git";
			flake = false;
		};
		nvimTokyonight = {
			url   = "git+https://git.voronind.com/mirror/tokyonight.nvim.git";
			flake = false;
		};
		nvimTree = {
			url   = "git+https://git.voronind.com/mirror/nvim-tree.lua.git";
			flake = false;
		};
		nvimTreesitter = {
			url   = "git+https://git.voronind.com/mirror/nvim-treesitter.git";
			flake = false;
		};
		nvimTrouble = {
			url   = "git+https://git.voronind.com/mirror/trouble.nvim.git";
			flake = false;
		};
		nvimWhichKey = {
			url   = "git+https://git.voronind.com/mirror/which-key.nvim.git";
			flake = false;
		};
	};

	outputs = { self, nixpkgs, nix-on-droid, home-manager, ... } @inputs: {
		# Constant values.
		nixosModules.const = {
			hashedPassword    = "$y$j9T$oqCB16i5E2t1t/HAWaFd5.$tTaHtAcifXaDVpTcRv.yH2/eWKxKE9xM8KcqXHfHrD7"; # Use `mkpasswd`.
			stateVersion      = "23.11";
			droidStateVersion = "22.11";
		};

		# Common modules used across all hosts.
		nixosModules.common.imports = [
			./module/common/AutoUpdate.nix
			./module/common/Bash.nix
			./module/common/Bootloader.nix
			./module/common/Distrobox.nix
			./module/common/Dotfiles.nix
			./module/common/Environment.nix
			./module/common/Filesystem.nix
			./module/common/Firefox.nix
			./module/common/Firewall.nix
			./module/common/Font.nix
			./module/common/Git.nix
			./module/common/Gtk.nix
			./module/common/Kernel.nix
			./module/common/Ld.nix
			./module/common/Locale.nix
			./module/common/Network.nix
			./module/common/Nix.nix
			./module/common/Nvim.nix
			./module/common/Package.nix
			./module/common/Root.nix
			./module/common/Ssh.nix
			./module/common/Sshd.nix
			./module/common/Swap.nix
			./module/common/Tmux.nix
			./module/common/Users.nix
			./module/common/Wallpaper.nix
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
			] ++ modules;

			specialArgs.const  = self.nixosModules.const;
			specialArgs.flake  = self;
			specialArgs.inputs = inputs;
		};

		# List of all hosts bellow.
		nixosConfigurations.dasha = self.mkHost {
			hostname = "dasha";
			system   = "x86_64-linux";
			modules = [
				./module/AmdGpu.nix
				./module/Desktop.nix
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
				./module/AmdCpu.nix
				./module/AmdGpu.nix
				./module/Desktop.nix
				./module/Gnome.nix
				./module/Ollama.nix
				./module/PowersaveAmd.nix
				./module/Print.nix
				./module/RemoteBuild.nix
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
				./module/Gnome.nix
				./module/Ollama.nix
				./module/PowersaveAmd.nix
				./module/RemoteBuilder.nix
				./user/Voronind.nix
			];
		};

		nixosConfigurations.laptop = self.mkHost {
			hostname = "laptop";
			system   = "x86_64-linux";
			modules = [
				./module/AmdCpu.nix
				./module/AmdGpu.nix
				./module/Desktop.nix
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
				./module/Desktop.nix
				./module/Gnome.nix
				./module/IntelCpu.nix
				./module/Ollama.nix
				./module/Powerlimit.nix
				./module/PowersaveIntel.nix
				./module/Print.nix
				./module/RemoteBuild.nix
				./user/Voronind.nix
			];
		};

		# Android.
		nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
			modules = [
				{ system.stateVersion = inputs.self.nixosModules.const.droidStateVersion; }
				./module/NixOnDroid.nix
			];
			extraSpecialArgs.const  = self.nixosModules.const;
			extraSpecialArgs.flake  = self;
			extraSpecialArgs.inputs = inputs;
		};
	};
}
