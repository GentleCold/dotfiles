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
        highlight = {
          pattern = [[\w*(KEYWORDS)\w*]],
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      })
      -- vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>TodoTelescope<cr>", { noremap = true })
    end,
  },
}
