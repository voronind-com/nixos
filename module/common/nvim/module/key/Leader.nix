{ key, ... }: {
	text = ''
		leader = "${key.meta.app.nvim}"

		vim.g.mapleader      = leader
		vim.g.maplocalleader = leader

		-- Disable key press timeout.
		vim.cmd("set notimeout nottimeout")
	'';
}
