{ setting, ... }: {
	text = ''
		vim.opt.autoindent  = true
		vim.opt.expandtab   = false
		-- vim.opt.smartindent = true
		vim.opt.shiftwidth  = ${setting.nvim.editor.indent.default}
		vim.opt.softtabstop = ${setting.nvim.editor.indent.default}
		vim.opt.tabstop     = ${setting.nvim.editor.indent.default}

		-- Disable Markdown forced formatting.
		vim.g.markdown_recommended_style = 0
	'';
}
