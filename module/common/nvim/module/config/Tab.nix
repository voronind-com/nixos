{ setting, ... }: {
	text = ''
		vim.opt.autoindent  = true
		vim.opt.expandtab   = false
		-- vim.opt.smartindent = true
		vim.opt.shiftwidth  = ${toString setting.nvim.editor.indent.default}
		vim.opt.softtabstop = ${toString setting.nvim.editor.indent.default}
		vim.opt.tabstop     = ${toString setting.nvim.editor.indent.default}

		-- Disable Markdown forced formatting.
		vim.g.markdown_recommended_style = 0
	'';
}
