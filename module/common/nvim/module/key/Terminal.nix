{ key, ... }: {
	text = ''
		-- Open terminal window.
		rekey_normal("<Leader>${key.nvim.window.terminal}", "<cmd>terminal<cr>")

		-- Detach from terminal with Esc key.
		rekey_terminal("<Esc>", "<C-\\><C-n>")
	'';
}
