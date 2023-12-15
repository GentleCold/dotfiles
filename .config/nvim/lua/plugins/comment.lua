return {
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTelescope" },
    event = "BufReadPost",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>fn", "<cmd>TodoQuickFix<cr>", desc = "Todo" },
    },
    config = function()
      require("todo-comments").setup({
        signs = false,
      })
      -- vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>TodoTelescope<cr>", { noremap = true })
    end,
  },
}
