{ key, ... }: {
	text = ''
		-- Sort visual selection alphabetically.
		rekey_visual("<Leader>${key.nvim.text.sort}", ":'<,'>sort<cr>")
	'';
}
