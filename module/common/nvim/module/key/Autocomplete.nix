{ key, ... }: {
	text = ''
		-- Autocomplete.
		rekey_input("<C-${key.action.launch}>", "<C-n>")

		-- LSP autocomplete.
		rekey_normal("<C-${key.action.launch}>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	'';
}
