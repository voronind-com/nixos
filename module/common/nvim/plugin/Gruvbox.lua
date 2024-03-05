vim.cmd([[
	if has('termguicolors')
		set termguicolors
	endif
]])

vim.o.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_better_performance = 1

vim.cmd("colorscheme gruvbox-material")
vim.cmd("let g:lightline = {'colorscheme' : 'gruvbox_material'}")
