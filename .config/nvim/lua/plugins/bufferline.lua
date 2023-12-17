return {
  {
    "romgrk/barbar.nvim",
    event = "BufEnter",
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      sidebar_filetypes = {
        ["neo-tree"] = { text = "neo-tree", event = "BufWipeout" },
      },
      focus_on_close = "previous",
      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        button = "x",
        -- Enables / disables diagnostic symbols
        -- diagnostics = {
        --   [vim.diagnostic.severity.ERROR] = { enabled = true },
        --   [vim.diagnostic.severity.WARN] = { enabled = true },
        --   [vim.diagnostic.severity.INFO] = { enabled = true },
        --   [vim.diagnostic.severity.HINT] = { enabled = true },
        -- },
        -- gitsigns = {
        -- 	added = { enabled = false, icon = "+" },
        -- 	changed = { enabled = true, icon = "~" },
        -- 	deleted = { enabled = false, icon = "-" },
        -- },
        pinned = { button = "󰐃", filename = true },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    config = function(_, opts)
      require("barbar").setup(opts)
    end,
  },
  -- {
  --   "tiagovla/scope.nvim",
  --   event = "BufEnter",
  --   config = function()
  --     require("scope").setup({
  --       restore_state = false,
  --     })
  --   end,
  -- },
}
