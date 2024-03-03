-- Write all we can and exit. Created this to drop non-writable stuff when piping to nvim.
function bye()
	pcall(vim.cmd, "wa")
	vim.cmd[[qa!]]
end

-- Repeat previous command.
rekey_normal("<Leader>.", "@:")
rekey_visual("<Leader>.", "@:")

-- Save everything.
rekey_normal("zz", "<cmd>wa<cr>")

-- Save all we can and leave.
rekey_normal("<Leader>z", "<cmd>lua bye()<cr>")

-- Compatibility alias for visual selection.
rekey_normal("<Leader>v", "v")

-- Remap ; to :.
rekey_normal(";", ":")
rekey_visual(";", ":")
