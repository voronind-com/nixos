{ key, ... }: {
	text = ''
		-- Show keymap help.
		rekey_normal("${key.nvim.window.whichkey}", "<cmd>WhichKey<cr>")
	'';
}
