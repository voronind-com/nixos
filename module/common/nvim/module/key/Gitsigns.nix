{ key, ... }: {
	text = ''
		-- Toggle Git inspection mode.
		rekey_normal("<Leader>${key.nvim.editor.git.inspect}", "<cmd>Gitsigns toggle_current_line_blame<cr><cmd>Gitsigns toggle_word_diff<cr><cmd>Gitsigns toggle_linehl<cr>")
	'';
}
