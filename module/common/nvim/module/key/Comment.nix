{ key, ... }: {
		text = ''
		-- Toggle comment for the selected line.
		vim.keymap.set("n", "<Leader>${key.nvim.text.comment}", require("SingleComment").SingleComment, { expr = true })

		-- Toggle comments for multiple lines.
		vim.keymap.set("v", "<Leader>${key.nvim.text.comment}", require("SingleComment").Comment, {})
	'';
}
