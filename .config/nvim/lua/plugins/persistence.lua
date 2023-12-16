-- return {
--   "folke/persistence.nvim",
--   event = "BufReadPre",
--   opts = {
--     options = vim.opt.sessionoptions:get(),
--     pre_save = function()
--       require("neo-tree.sources.manager").close_all()
--       vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
--     end,
--   },
--   -- stylua: ignore
--   keys = {
--     -- { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
--     { "<leader>s", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
--     -- { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
--   },
--   config = function(_, opts)
--     require("persistence").setup(opts)
--   end,
-- }
-- return {
--   "Shatur/neovim-session-manager",
--   event = "BufReadPre",
--   cmd = {
--     "SessionManager",
--   },
--   keys = {
--     { "<leader>sl", "<cmd>SessionManager load_session<cr>", desc = "Load Session" },
--     { "<leader>sd", "<cmd>SessionManager delete_session<cr>", desc = "Delete Session" },
--   },
--   config = function()
--     vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
--     require("session_manager").setup({})
--   end,
-- }
--
-- FIX: session error
return {
  "rmagatti/auto-session",
  event = "BufReadPre",
  cmd = {
    "Autosession",
  },
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require("auto-session").setup({})
  end,
}
