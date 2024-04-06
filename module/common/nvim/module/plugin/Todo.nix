{ ... }: {
	text = ''
		require("todo-comments").setup {
			sign_priority = 8,
			signs         = false,
			keywords = {
				FIX = {
					alt   = { "FIXME", "BUG", "FIXIT", "ISSUE" },
					color = "error",
					icon  = " ",
				},
				HACK = { icon = " ", color = "warning" },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				TODO = { icon = " ", color = "info" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			},
			gui_style = {
				bg = "BOLD",
				fg = "NONE",
			},
			merge_keywords = true,
			highlight = {
				after             = "fg",
				before            = "",
				comments_only     = true,
				exclude           = {},
				keyword           = "wide",
				max_line_len      = 400,
				multiline         = true,
				multiline_context = 10,
				multiline_pattern = "^.",
				pattern           = [[.*<(KEYWORDS)\s*:]],
			},
			colors = {
				default = { "Identifier", "#7C3AED" },
				error   = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				hint    = { "DiagnosticHint", "#10B981" },
				info    = { "DiagnosticInfo", "#2563EB" },
				test    = { "Identifier", "#FF00FF" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				pattern = [[\b(KEYWORDS):]],
			},
		}
	'';
}
