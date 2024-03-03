-- Update all command.
vim.api.nvim_create_user_command("Update", function (args)
	vim.cmd("PackerUpdate")
	vim.cmd("TSUpdate")
end, { desc = "Update everything." })
