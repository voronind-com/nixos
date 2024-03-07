{ pkgs, inputs, const, ... }: let
	homePath = "/data/data/com.termux.nix/files/home";
in {
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
		nmap
		openssh
		parallel
		pv
		ripgrep
		rsync
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
			".dotfiles".source   = inputs.self;
			".bash".source       = ./common/bash;
			".nvim".source       = ./common/nvim;
			".ssh/config".source = ./common/ssh/Config;
		};
		home.sessionVariables = {
			BASH_MODULE_PATH = "${homePath}/.bash/module";
			BASH_PATH        = "${homePath}/.bash";
		};
		programs.bash = {
			enable      = true;
			bashrcExtra = "source ${homePath}/.bash/Bashrc.sh";
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
		programs.neovim = { # TODO: Find a way to reuse global config.
			enable   = true;
			viAlias  = true;
			vimAlias = true;
			extraConfig = ''
				set runtimepath+=~/.cache/nvim
				set runtimepath+=~/.cache/nvim/treesitter
				set runtimepath+=${inputs.nvimAlign}
				set runtimepath+=${inputs.nvimAutoclose}
				set runtimepath+=${inputs.nvimBufferline}
				set runtimepath+=${inputs.nvimCloseBuffers}
				set runtimepath+=${inputs.nvimDevicons}
				set runtimepath+=${inputs.nvimGitsigns}
				set runtimepath+=${inputs.nvimGruvboxMaterial}
				set runtimepath+=${inputs.nvimIndentoMatic}
				set runtimepath+=${inputs.nvimLspconfig}
				set runtimepath+=${inputs.nvimLualine}
				set runtimepath+=${inputs.nvimOllama}
				set runtimepath+=${inputs.nvimPlenary}
				set runtimepath+=${inputs.nvimSingleComment}
				set runtimepath+=${inputs.nvimTelescope}
				set runtimepath+=${inputs.nvimTodo}
				set runtimepath+=${inputs.nvimTokyonight}
				set runtimepath+=${inputs.nvimTreesitter}
				set runtimepath+=${inputs.nvimTree}
				set runtimepath+=${inputs.nvimTrouble}
				set runtimepath+=${inputs.nvimWhichKey}

				lua dofile("${homePath}/.nvim/key/Rekey.lua")
				lua dofile("${homePath}/.nvim/key/Leader.lua")
				lua dofile("${homePath}/.nvim/config/Autoread.lua")
				lua dofile("${homePath}/.nvim/config/Etc.lua")
				lua dofile("${homePath}/.nvim/config/Search.lua")
				lua dofile("${homePath}/.nvim/config/Tab.lua")
				lua dofile("${homePath}/.nvim/plugin/Filetree.lua")
				lua dofile("${homePath}/.nvim/plugin/lsp/Rust.lua")
				lua dofile("${homePath}/.nvim/plugin/lsp/Tex.lua")
				lua dofile("${homePath}/.nvim/plugin/Bufferline.lua")
				lua dofile("${homePath}/.nvim/plugin/Lualine.lua")
				lua dofile("${homePath}/.nvim/plugin/Autoclose.lua")
				lua dofile("${homePath}/.nvim/plugin/Gitsigns.lua")
				lua dofile("${homePath}/.nvim/plugin/Trouble.lua")
				lua dofile("${homePath}/.nvim/plugin/Tokyonight.lua")
				lua dofile("${homePath}/.nvim/plugin/Gruvbox.lua")
				lua dofile("${homePath}/.nvim/plugin/Closebuffers.lua")
				lua dofile("${homePath}/.nvim/plugin/Telescope.lua")
				lua dofile("${homePath}/.nvim/plugin/Todo.lua")
				lua dofile("${homePath}/.nvim/plugin/Indent.lua")
				lua dofile("${homePath}/.nvim/plugin/Align.lua")
				lua dofile("${homePath}/.nvim/plugin/Treesitter.lua")
				lua dofile("${homePath}/.nvim/plugin/Fold.lua")
				lua dofile("${homePath}/.nvim/plugin/Ollama.lua")
				lua dofile("${homePath}/.nvim/key/Autocomplete.lua")
				lua dofile("${homePath}/.nvim/key/Buffer.lua")
				lua dofile("${homePath}/.nvim/key/Comment.lua")
				lua dofile("${homePath}/.nvim/key/Common.lua")
				lua dofile("${homePath}/.nvim/key/Filetree.lua")
				lua dofile("${homePath}/.nvim/key/Fold.lua")
				lua dofile("${homePath}/.nvim/key/Gitsigns.lua")
				lua dofile("${homePath}/.nvim/key/Lsp.lua")
				lua dofile("${homePath}/.nvim/key/Navigation.lua")
				lua dofile("${homePath}/.nvim/key/Ollama.lua")
				lua dofile("${homePath}/.nvim/key/Sort.lua")
				lua dofile("${homePath}/.nvim/key/Telescope.lua")
				lua dofile("${homePath}/.nvim/key/Terminal.lua")
				lua dofile("${homePath}/.nvim/key/Todo.lua")
				lua dofile("${homePath}/.nvim/key/Trouble.lua")
				lua dofile("${homePath}/.nvim/key/Update.lua")
				lua dofile("${homePath}/.nvim/key/Whichkey.lua")
			'';
		};
	};
}
