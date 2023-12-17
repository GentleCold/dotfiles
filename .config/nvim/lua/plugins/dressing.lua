return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        border = "single",
        win_options = {
          -- winhighlight = "Normal:CmpDoc",
        },
      },
      select = {
        telescope = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          layout_config = {
            height = 0.5,
            width = 0.5,
          },
        },
        nui = {
          border = {
            style = "single",
          },
        },
        builtin = {
          border = "single",
        },
      },
    },
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
  },
}
