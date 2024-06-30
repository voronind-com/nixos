{ ... }: {
		text = ''
		-- Toggle comment for the selected line.
		vim.keymap.set("n", "<Leader>/", require("SingleComment").SingleComment, { expr = true })

		-- Toggle comments for multiple lines.
		vim.keymap.set("v", "<Leader>/", require("SingleComment").Comment, {})
	'';
}
