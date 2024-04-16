{ inputs, pkgs, util, key, ... } @args: let
	nvimRc = { runtimes, cfgs }: let
		runtimeRc = builtins.foldl' (acc: r:
			acc + "set runtimepath+=${r}\n"
		) "" runtimes;

		config = pkgs.writeText "nvimRc" (builtins.foldl' (acc: cfg:
			acc + (import cfg args).text
		) "" cfgs);

		cfgRc = "lua dofile(\"${config}\")";
	in runtimeRc + cfgRc;
in {
	config = util.trimTabs (nvimRc {
		runtimes = [
			"~/.cache/nvim"
			"~/.cache/nvim/treesitter"
			"${inputs.nvimAlign}"
			"${inputs.nvimAutoclose}"
			"${inputs.nvimBufferline}"
			"${inputs.nvimCloseBuffers}"
			"${inputs.nvimColorizer}"
			"${inputs.nvimDevicons}"
			"${inputs.nvimGitsigns}"
			"${inputs.nvimGruvboxMaterial}"
			"${inputs.nvimIndentoMatic}"
			"${inputs.nvimLspconfig}"
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
			./module/key/Rekey.nix
			./module/key/Leader.nix
			./module/config/Autoread.nix
			./module/config/Etc.nix
			./module/config/Search.nix
			./module/config/Tab.nix
			./module/plugin/Filetree.nix
			./module/plugin/Gruvbox.nix
			./module/plugin/Bufferline.nix
			./module/plugin/Autoclose.nix
			./module/plugin/Gitsigns.nix
			./module/plugin/Trouble.nix
			./module/plugin/Tokyonight.nix
			./module/plugin/Closebuffers.nix
			./module/plugin/Telescope.nix
			./module/plugin/Todo.nix
			./module/plugin/Indent.nix
			./module/plugin/Align.nix
			./module/plugin/Treesitter.nix
			./module/plugin/Fold.nix
			./module/plugin/Ollama.nix
			./module/plugin/Colorizer.nix
			./module/plugin/lsp/Haskell.nix
			./module/plugin/lsp/Rust.nix
			./module/plugin/lsp/Tex.nix
			./module/plugin/lsp/Nix.nix
			./module/key/Autocomplete.nix
			./module/key/Buffer.nix
			./module/key/Colorscheme.nix
			./module/key/Comment.nix
			./module/key/Common.nix
			./module/key/Filetree.nix
			./module/key/Gitsigns.nix
			./module/key/Navigation.nix
			./module/key/Ollama.nix
			./module/key/Sort.nix
			./module/key/Telescope.nix
			./module/key/Terminal.nix
			./module/key/Todo.nix
			./module/key/Trouble.nix
			./module/key/Whichkey.nix
		];
	});
}