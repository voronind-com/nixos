{ key, ... }: {
	text = ''
		-- Write all we can and exit. Created this to drop non-writable stuff when piping to nvim.
		function bye()
			pcall(vim.cmd, "wa")
			vim.cmd[[qa!]]
		end

		function toggle_tab_width()
			if vim.bo.shiftwidth == 2 then
				vim.bo.shiftwidth  = 4
				vim.bo.tabstop     = 4
				vim.bo.softtabstop = 4
			elseif vim.bo.shiftwidth == 4 then
				vim.bo.shiftwidth  = 8
				vim.bo.tabstop     = 8
				vim.bo.softtabstop = 8
			elseif vim.bo.shiftwidth == 8 then
				vim.bo.shiftwidth  = 2
				vim.bo.tabstop     = 2
				vim.bo.softtabstop = 2
			end
		end

		rekey_normal("<Leader>${key.nvim.editor.indent.size}", "<cmd>lua toggle_tab_width()<cr>")

		-- Repeat previous command.
		rekey_normal("<Leader>${key.action.repeat}", "@:")
		rekey_visual("<Leader>${key.action.repeat}", "@:")

		-- Save everything.
		rekey_normal("${key.action.wait}${key.action.wait}", "<cmd>wa<cr>")

		-- Save all we can and leave.
		rekey_normal("<Leader>${key.action.wait}", "<cmd>lua bye()<cr>")

		-- Remap ; to :.
		rekey_normal(";", ":")
		rekey_visual(";", ":")
	'';
}