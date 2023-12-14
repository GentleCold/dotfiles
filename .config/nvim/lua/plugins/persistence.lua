return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = vim.opt.sessionoptions:get(),
    pre_save = function()
      require 'neo-tree.sources.manager'.close_all()
      vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
    end
  },
  -- stylua: ignore
  keys = {
    -- { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>s", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    -- { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  config = function(_, opts)
    require("persistence").setup(opts)
  end,
}
