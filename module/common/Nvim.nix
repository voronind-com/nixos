{ inputs, util, ... }: let
	nvimRc = { cfgPath, runtimes, cfgs }: let
		runtimeRc = builtins.foldl' (acc: r:
			acc + "set runtimepath+=${r}\n"
		) "" runtimes;
		cfgRc = builtins.foldl' (acc: c:
			acc + "lua dofile(\"${cfgPath}/${c}\")\n"
		) "" cfgs;
	in runtimeRc + cfgRc;
in {
	environment.etc.nvim.source = ./nvim;
	programs.neovim = {
		enable   = true;
		viAlias  = true;
		vimAlias = true;
		configure = {
			customRC = util.nvimRc {
				cfgPath = "/etc/nvim";
				runtimes = [
					"~/.cache/nvim"
					"~/.cache/nvim/treesitter"
					"${inputs.nvimAlign}"
					"${inputs.nvimAutoclose}"
					"${inputs.nvimBufferline}"
					"${inputs.nvimCloseBuffers}"
					"${inputs.nvimDevicons}"
					"${inputs.nvimGitsigns}"
					"${inputs.nvimGruvboxMaterial}"
					"${inputs.nvimIndentoMatic}"
					"${inputs.nvimLspconfig}"
					"${inputs.nvimLualine}"
					"${inputs.nvimOllama}"
					"${inputs.nvimPlenary}"
					"${inputs.nvimSingleComment}"
					"${inputs.nvimTelescope}"
					"${inputs.nvimTodo}"
					"${inputs.nvimTokyonight}"
					"${inputs.nvimTreesitter}"
					"${inputs.nvimTree}"
					"${inputs.nvimTrouble}"
					"${inputs.nvimWhichKey}"
				];
				cfgs = [
					"key/Rekey.lua"
					"key/Leader.lua"
					"config/Autoread.lua"
					"config/Etc.lua"
					"config/Search.lua"
					"config/Tab.lua"
					"plugin/Filetree.lua"
					"plugin/lsp/Rust.lua"
					"plugin/lsp/Tex.lua"
					"plugin/Gruvbox.lua"
					"plugin/Bufferline.lua"
					"plugin/Lualine.lua"
					"plugin/Autoclose.lua"
					"plugin/Gitsigns.lua"
					"plugin/Trouble.lua"
					"plugin/Tokyonight.lua"
					"plugin/Closebuffers.lua"
					"plugin/Telescope.lua"
					"plugin/Todo.lua"
					"plugin/Indent.lua"
					"plugin/Align.lua"
					"plugin/Treesitter.lua"
					"plugin/Fold.lua"
					"plugin/Ollama.lua"
					"key/Autocomplete.lua"
					"key/Buffer.lua"
					"key/Colorscheme.lua"
					"key/Comment.lua"
					"key/Common.lua"
					"key/Filetree.lua"
					"key/Fold.lua"
					"key/Gitsigns.lua"
					"key/Lsp.lua"
					"key/Navigation.lua"
					"key/Ollama.lua"
					"key/Sort.lua"
					"key/Telescope.lua"
					"key/Terminal.lua"
					"key/Todo.lua"
					"key/Trouble.lua"
					"key/Update.lua"
					"key/Whichkey.lua"
				];
			};
		};
	};
}
