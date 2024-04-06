{ key, ... }: {
	text = ''
		-- Toggle To-do window.
		rekey_normal("<Leader>${key.nvim.window.todo}", "<cmd>TroubleToggle todo<cr>")
	'';
}
