return {
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --     })
  --     require("onedark").load()
  --   end,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   enable = false,
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "storm",
  --     transparent = false,
  --     styles = {
  --       sidebars = "dark",
  --       floats = "dark",
  --     },
  --     -- on_colors = function(colors)
  --     --   colors.border = "#565f89"
  --     --   colors.bg_statusline = "#373b4e"
  --     --   colors.border_highlight = "#c0caf5"
  --     -- end,
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      term_colors = true,
      integrations = {
        symbols_outline = true,
        illuminate = {
          enabled = false,
          lsp = false,
        },
        aerial = true,
        alpha = true,
        barbar = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        -- illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
