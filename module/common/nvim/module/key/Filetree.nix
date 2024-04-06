{ key, ... }: {
	text = ''
		-- Toggle file tree.
		rekey_normal("<Leader>${key.nvim.window.filetree}", "<cmd>NvimTreeToggle<cr>")
	'';
}
