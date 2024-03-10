vim.cmd([[
	if has('termguicolors')
		set termguicolors
	endif
]])

vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
-- vim.g.gruvbox_material_better_performance = 1 -- NOTE: Broken on NixOS.

vim.cmd("colorscheme gruvbox-material")
vim.cmd("let g:lightline = {'colorscheme' : 'gruvbox_material'}")
