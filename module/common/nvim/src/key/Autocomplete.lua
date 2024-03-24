-- Autocomplete.
rekey_input("<C-Space>", "<C-n>")

-- LSP autocomplete.
rekey_normal("<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
