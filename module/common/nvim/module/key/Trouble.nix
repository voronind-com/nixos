{ key, ... }: {
	text = ''
		-- Toggle diagnostics window.
		rekey_normal("<Leader>${key.nvim.window.trouble}", "<cmd>TroubleToggle document_diagnostics<cr>")
	'';
}
