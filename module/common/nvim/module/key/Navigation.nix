{ key, setting, ... }: {
	text = ''
		-- Switch windows.
		rekey_normal("<Leader>${key.navigation.go.left}",  "<C-w>h")
		rekey_normal("<Leader>${key.navigation.go.right}", "<C-w>l")
		rekey_normal("<Leader>${key.navigation.go.down}",  "<C-w>j")
		rekey_normal("<Leader>${key.navigation.go.up}",    "<C-w>k")

		-- Switch buffers.
		rekey_normal("<Leader>${key.navigation.move.next}", "<cmd>BufferLineMoveNext<cr>")
		rekey_normal("<Leader>${key.navigation.move.prev}", "<cmd>BufferLineMovePrev<cr>")
		rekey_normal("<Leader>${key.navigation.go.next}",   "<cmd>BufferLineCycleNext<cr>")
		rekey_normal("<Leader>${key.navigation.go.prev}",   "<cmd>BufferLineCyclePrev<cr>")

		-- Splits.
		rekey_normal("<Leader>${key.action.split.vertical}",   "<cmd>vsplit<cr>")
		rekey_normal("<Leader>${key.action.split.horizontal}", "<cmd>split<cr>")
		rekey_normal("<Leader>${key.action.resize.equalize}",  "<C-w>=") -- Equalize split sizes.
		rekey_normal("<Leader>${key.action.hide}",             "<C-w>q") -- Close split.

		-- Resize splits.
		rekey_normal("<Leader>${key.action.resize.left}",  "${toString setting.tmux.resize.step.horizontal}<C-w><")
		rekey_normal("<Leader>${key.action.resize.right}", "${toString setting.tmux.resize.step.horizontal}<C-w>>")
		rekey_normal("<Leader>${key.action.resize.down}",  "${toString setting.tmux.resize.step.vertical}<C-w>+")
		rekey_normal("<Leader>${key.action.resize.up}",    "${toString setting.tmux.resize.step.vertical}<C-w>-")

		-- Move splits.
		rekey_normal("<Leader>${key.navigation.move.left}",  "<C-w>A")
		rekey_normal("<Leader>${key.navigation.move.right}", "<C-w>D")
		rekey_normal("<Leader>${key.navigation.move.down}",  "<C-w>S")
		rekey_normal("<Leader>${key.navigation.move.up}",    "<C-w>W")
	'';
}
