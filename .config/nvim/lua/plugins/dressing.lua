local function border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end
return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        border = border("NormalFLoat"),
        -- win_options = {
        --   winhighlight = "Normal:CmpDoc",
        -- },
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
