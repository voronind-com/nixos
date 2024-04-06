{ setting, ... }: {
	text = ''
		-- TODO: Add comments and separate files.
		vim.opt.clipboard     = "unnamedplus"
		-- vim.opt.completeopt   = "menuone,noselect"
		vim.opt.cursorline    = false
		vim.opt.fixeol        = false
		vim.opt.number        = true
		vim.opt.splitbelow    = true
		vim.opt.splitright    = true
		vim.opt.termguicolors = true
		vim.opt.ttyfast       = true
		vim.opt.wildmode      = "longest,list"

		-- Disable continuing comments on newline.
		vim.cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")

		-- Disable mouse.
		vim.cmd("set mouse=")

		-- Disable signs for diagnostics.
		vim.diagnostic.config({ signs = false })

		-- Display invisible characters.
		-- vim.cmd("set list listchars=tab:>\\ ,trail:-,eol:,lead:.")
		vim.cmd("set list listchars=tab:>\\ ,trail:-,lead:.")

		-- Relative line numbers.
		vim.wo.relativenumber = ${setting.nvim.editor.relativenumber}
	'';
}
