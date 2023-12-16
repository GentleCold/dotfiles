return {
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("onedarkpro").setup({
  --
  --     })
  --     -- somewhere in your config:
  --     vim.cmd("colorscheme onedark Vivid")
  --   end
  -- }

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },
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
}

-- _name = "tokyonight_storm",
-- bg = "#24283b",
-- bg_dark = "#1f2335",
-- bg_float = "#1f2335",
-- bg_highlight = "#292e42",
-- bg_popup = "#1f2335",
-- bg_search = "#3d59a1",
-- bg_sidebar = "#1f2335",
-- bg_statusline = "#1f2335",
-- bg_visual = "#2e3c64",
-- black = "#1d202f",
-- blue = "#7aa2f7",
-- blue0 = "#3d59a1",
-- blue1 = "#2ac3de",
-- blue2 = "#0db9d7",
-- blue5 = "#89ddff",
-- blue6 = "#b4f9f8",
-- blue7 = "#394b70",
-- border = "#1d202f",
-- border_highlight = "#29a4bd",
-- comment = "#565f89",
-- cyan = "#7dcfff",
-- dark3 = "#545c7e",
-- dark5 = "#737aa2",
-- delta = {
--   add = "#316172",
--   delete = "#763842"
-- },
