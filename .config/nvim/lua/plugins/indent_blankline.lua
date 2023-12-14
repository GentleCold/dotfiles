return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		config = function(_, opts)
			-- local highlight = {
			--   "RainbowRed",
			--   "RainbowYellow",
			--   "RainbowBlue",
			--   "RainbowOrange",
			--   "RainbowGreen",
			--   "RainbowViolet",
			--   "RainbowCyan",
			-- }
			--
			-- local hooks = require "ibl.hooks"
			-- -- create the highlight groups in the highlight setup hook, so they are reset
			-- -- every time the colorscheme changes
			-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			--   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			--   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			--   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			--   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			--   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			--   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			--   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			-- end)
			-- opts.indent.highlight = highlight
			require("ibl").setup(opts)
		end,
		main = "ibl",
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
