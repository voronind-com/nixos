require("tokyonight").setup({
	light_style     = "night",
	style           = "night",
	terminal_colors = true,
	transparent     = false,
	styles = {
		comments  = { italic = true },
		floats    = "dark",
		functions = {},
		keywords  = { italic = true },
		sidebars  = "dark",
		variables = {},
	},
	day_brightness           = 0.3,
	dim_inactive             = false,
	hide_inactive_statusline = false,
	lualine_bold             = false,
	on_colors                = function(colors) end,
	on_highlights            = function(highlights, colors) end,
	sidebars                 = { "qf", "help" },
})

-- vim.cmd[[colorscheme tokyonight]]
