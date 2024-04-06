{ key, ... }: let
	mod = key.nvim.telescope.mod;
in {
	text = ''
		rekey_normal("<Leader>${mod}${key.nvim.telescope.all}", "<cmd>Telescope<cr>")
		rekey_normal("<Leader>${mod}${key.nvim.telescope.buffer}", "<cmd>lua require('telescope.builtin').buffers()<cr>")
		rekey_normal("<Leader>${mod}${key.nvim.telescope.file}", "<cmd>lua require('telescope.builtin').find_files()<cr>")
		rekey_normal("<Leader>${mod}${key.nvim.telescope.grep}", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
		rekey_normal("<Leader>${mod}${key.nvim.telescope.help}", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
		rekey_normal("<Leader>${mod}${key.nvim.telescope.treesitter}", "<cmd>Telescope treesitter<cr>")
	'';
}
