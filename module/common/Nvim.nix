{ environment, inputs, ... }: let
	nvimSrc = "/etc/nvim";
in {
	environment.etc.nvim.source = ./nvim;

	programs.neovim = {
		enable   = true;
		viAlias  = true;
		vimAlias = true;
		configure = {
			customRC = ''
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

				lua dofile("${nvimSrc}/key/Rekey.lua")
				lua dofile("${nvimSrc}/key/Leader.lua")
				lua dofile("${nvimSrc}/config/Autoread.lua")
				lua dofile("${nvimSrc}/config/Etc.lua")
				lua dofile("${nvimSrc}/config/Search.lua")
				lua dofile("${nvimSrc}/config/Tab.lua")
				lua dofile("${nvimSrc}/plugin/Filetree.lua")
				lua dofile("${nvimSrc}/plugin/lsp/Rust.lua")
				lua dofile("${nvimSrc}/plugin/lsp/Tex.lua")
				lua dofile("${nvimSrc}/plugin/Gruvbox.lua")
				lua dofile("${nvimSrc}/plugin/Bufferline.lua")
				lua dofile("${nvimSrc}/plugin/Lualine.lua")
				lua dofile("${nvimSrc}/plugin/Autoclose.lua")
				lua dofile("${nvimSrc}/plugin/Gitsigns.lua")
				lua dofile("${nvimSrc}/plugin/Trouble.lua")
				lua dofile("${nvimSrc}/plugin/Tokyonight.lua")
				lua dofile("${nvimSrc}/plugin/Closebuffers.lua")
				lua dofile("${nvimSrc}/plugin/Telescope.lua")
				lua dofile("${nvimSrc}/plugin/Todo.lua")
				lua dofile("${nvimSrc}/plugin/Indent.lua")
				lua dofile("${nvimSrc}/plugin/Align.lua")
				lua dofile("${nvimSrc}/plugin/Treesitter.lua")
				lua dofile("${nvimSrc}/plugin/Fold.lua")
				lua dofile("${nvimSrc}/plugin/Ollama.lua")
				lua dofile("${nvimSrc}/key/Autocomplete.lua")
				lua dofile("${nvimSrc}/key/Buffer.lua")
				lua dofile("${nvimSrc}/key/Colorscheme.lua")
				lua dofile("${nvimSrc}/key/Comment.lua")
				lua dofile("${nvimSrc}/key/Common.lua")
				lua dofile("${nvimSrc}/key/Filetree.lua")
				lua dofile("${nvimSrc}/key/Fold.lua")
				lua dofile("${nvimSrc}/key/Gitsigns.lua")
				lua dofile("${nvimSrc}/key/Lsp.lua")
				lua dofile("${nvimSrc}/key/Navigation.lua")
				lua dofile("${nvimSrc}/key/Ollama.lua")
				lua dofile("${nvimSrc}/key/Sort.lua")
				lua dofile("${nvimSrc}/key/Telescope.lua")
				lua dofile("${nvimSrc}/key/Terminal.lua")
				lua dofile("${nvimSrc}/key/Todo.lua")
				lua dofile("${nvimSrc}/key/Trouble.lua")
				lua dofile("${nvimSrc}/key/Update.lua")
				lua dofile("${nvimSrc}/key/Whichkey.lua")
			'';
		};
	};
}
