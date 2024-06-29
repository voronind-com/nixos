# This is a configuration entry-point called "Flake".
# Here you define your inputs (dependencies) and outputs (hosts).
{
	# Those are external dependencies.
	inputs = {
		# Core system.
		# Homepage: https://github.com/NixOS/nixpkgs
		# Manual:   https://nixos.org/manual/nixos/stable
		# Search:   https://search.nixos.org/packages and https://search.nixos.org/options
		nixpkgs.url       = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgsStable.url = "github:nixos/nixpkgs/nixos-24.05";
		nixpkgsMaster.url = "github:nixos/nixpkgs/master";

		# This thing manages user's /home directroies. Because NixOS only manages system itself.
		# Homepage: https://github.com/nix-community/home-manager
		# Manual:   https://nix-community.github.io/home-manager
		# Search:   https://home-manager-options.extranix.com
		home-manager = {
			url = "github:nix-community/home-manager";

			# This means that home-manager and our Flake both depend on the same nixpkgs version.
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# This allows automatic styling based on active Wallpaper.
		# Homepage: https://github.com/danth/stylix
		# Manual:   https://danth.github.io/stylix
		stylix.url  = "github:danth/stylix";

		# I use this for a single container called jobber. WARN: Do not update.
		# You likely won't need this one, so just skip it for now.
		poetry2nixJobber.url = "github:nix-community/poetry2nix/304f8235fb0729fd48567af34fcd1b58d18f9b95";
		nixpkgsJobber.url    = "github:nixos/nixpkgs/051f920625ab5aabe37c920346e3e69d7d34400e";

		# Nix on Android (inside Termux). It has no NixOS modules, but still allows the use of Nixpkgs arm packages with Home-Manager configurations.
		# Homepage: https://github.com/nix-community/nix-on-droid
		# Manual:   https://github.com/nix-community/nix-on-droid/blob/master/README.md
		nix-on-droid = {
			url = "github:t184256/nix-on-droid/release-23.11";
			inputs.nixpkgs.follows      = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};

		# Those are Nvim plugins. I do not use package managers like Packer or Lazy, instead I use Nix to download them and later configure in [Neovim module](module/common/Nvim.nix).
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

	# Those are outputs (hosts, configurations) that can be produced by this whole config.
	# Here you see a set of inputs we defined above, like nixpkgs, home-manager and so on.
	# `...` at the end of a set means "ignore other arguments provided to this function".
	# @inputs means aliasing all the inputs to the `inputs` name, so we can pass them all at once later.
	outputs = { self, nixpkgs, nixpkgsStable, nixpkgsMaster, nix-on-droid, home-manager, stylix, poetry2nixJobber, nixpkgsJobber, ... } @inputs: {
		# Constant values.
		const = {
			droidStateVersion = "23.11";
			stateVersion      = "24.05";
			timeZone = "Europe/Moscow";
			url = "https://git.voronind.com/voronind/nixos.git";
		};

		nixosConfigurations = let
			# List all files in a dir.
			lsFiles = path: map (f: "${path}/${f}") (
				builtins.filter (i: builtins.readFileType "${path}/${i}" == "regular") (
					builtins.attrNames (builtins.readDir path)
				)
			);

			# Function to create a host. It does basic setup, like adding common modules.
			mkHost = { system, hostname, modules } @args: nixpkgs.lib.nixosSystem {
				# `Inherit` is just an alias for `system = system;`, which means that
				# keep the `system` argument as a property in a resulting set.
				inherit system;

				# List of modules to use by defualt for all the hosts.
				modules = modules ++ [
					# There I put host-specific configurations.
					./host/${hostname}

					# Make a device hostname match the one from this config.
					{ networking.hostName = hostname; }

					# Specify current release version.
					{ system.stateVersion = self.const.stateVersion; }

					# Add modules.
					{ imports =
						(lsFiles ./container) ++
						(lsFiles ./module) ++
						(lsFiles ./module/common) ++
						(lsFiles ./module/desktop) ++
						(lsFiles ./overlay) ++
						(lsFiles ./user);
					}

					# Add Home Manager module.
					home-manager.nixosModules.home-manager

					# Add Stylix module.
					stylix.nixosModules.stylix
				];

				# SpecialArgs allows you to pass objects down to other NixOS modules.
				specialArgs = let
					pkgs   = nixpkgs.legacyPackages.${system}.pkgs;
					lib    = nixpkgs.lib;
					config = self.nixosConfigurations.${hostname}.config;

					pkgsJobber = nixpkgsJobber.legacyPackages.${system}.pkgs;
					pkgsStable = nixpkgsJobber.legacyPackages.${system}.pkgs;
					pkgsMaster = nixpkgsJobber.legacyPackages.${system}.pkgs;

					secret    = import ./secret {}; # Secrets (public keys).
					container = import ./lib/Container.nix { inherit lib pkgs config; inherit (self) const; }; # Container utils.
					util      = import ./lib/Util.nix { inherit lib; }; # Util functions.
				in {
					flake = self;

					inherit secret container util inputs;
					inherit (self) const;

					# Stable and Master pkgs.
					inherit pkgsStable pkgsMaster;

					# Stuff for Jobber container, skip this part.
					inherit poetry2nixJobber pkgsJobber;
				};
			};

			mkSystem = hostname: system: modules: {
				"${hostname}" = mkHost {
					inherit hostname system modules;
				};
			};

			liveModules = [
				"${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
				"${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"

				{ networking.wireless.enable = nixpkgs.lib.mkForce false; }

				# Override my settings to allow SSH logins using root password.
				{ services.openssh.settings.PasswordAuthentication = nixpkgs.lib.mkForce true; }
				{ services.openssh.settings.PermitRootLogin        = nixpkgs.lib.mkForce "yes"; }

				# Disable auto-updates as they are not possible for Live ISO.
				{ module.common.autoupdate.enable = false; }

				# Base Live images also require the LTS kernel.
				{ module.common.kernel.latest = false; }
			];

			x86System = hostname: mkSystem hostname "x86_64-linux" [];

			x86LiveSystem = hostname: mkSystem hostname "x86_64-linux" liveModules;
		in nixpkgs.lib.foldl' (acc: h: acc // h) {} [
			# Bellow is the list of all the hosts I currently use.
			# They call the `mkSystem` function that I defined above
			# with their specific parameters.
			# You might be interested in `live` and `nixOnDroidConfiguration`
			# for Live ISO and Android configurations respectively.
			(x86System "dasha")
			(x86System "desktop")
			(x86System "fsight")
			(x86System "home")
			(x86System "laptop")
			(x86System "work")
			(x86LiveSystem "live")
		];

		# Android.
		nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
			modules = [
				# Android release version.
				{ system.stateVersion = inputs.self.const.droidStateVersion; }

				# I put all my Android configuration there.
				./android
			];

			# SpecialArgs allows you to pass objects down to other configuration.
			extraSpecialArgs = let
				# We want arm64 packages for Android.
				pkgs = nixpkgs.legacyPackages."aarch64-linux".pkgs;
				lib  = nixpkgs.lib;
			in {
				const   = self.const; # Constant values.
				flake   = self;       # This Flake itself.
				inputs  = inputs;     # Our dependencies.
				secret  = import ./lib/Secret.nix  {}; # Secrets (public keys).
				util    = import ./lib/Util.nix    { inherit lib; }; # Util functions.
			};
		};
	};
}
# That's it!
