-- return {
--   "folke/persistence.nvim",
--   event = "BufReadPre",
--   opts = {
--     options = vim.opt.sessionoptions:get(),
--     pre_save = function()
--       require("neo-tree.sources.manager").close_all()
--       vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
--       require("scope.session").serialize_state()
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
return {
  "Shatur/neovim-session-manager",
  event = "BufReadPre",
  cmd = {
    "SessionManager",
  },
  keys = {
    { "<leader>s", "<cmd>SessionManager load_session<cr>", desc = "Load Session" },
    { "<leader>sd", "<cmd>SessionManager delete_session<cr>", desc = "Delete Session" },
    { "<leader>sp", "<cmd>SessionManager save_current_session<cr>", desc = "Save Session" },
  },
  config = function()
    -- local config_group = vim.api.nvim_create_augroup("Session", {}) -- A global group for all your config autocommands
    --
    -- vim.api.nvim_create_autocmd({ "User" }, {
    --   pattern = "SessionSavePre",
    --   group = config_group,
    --   callback = function()
    --     vim.cmd([[ScopeSaveState]])
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd({ "User" }, {
    --   pattern = "SessionLoadPost",
    --   group = config_group,
    --   callback = function()
    --     vim.cmd([[ScopeLoadState]])
    --   end,
    -- })
    require("session_manager").setup({
      autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
    })
  end,
}
--
-- return {
--   {
--     "olimorris/persisted.nvim",
--     event = "BufReadPre",
--     cmd = {
--       "SessionStart",
--     },
--     config = function()
--       local group = vim.api.nvim_create_augroup("PersistedHooks", {})
--
--       vim.api.nvim_create_autocmd({ "User" }, {
--         pattern = "PersistedSavePre",
--         group = group,
--         callback = function()
--           vim.cmd([[ScopeSaveState]])
--         end,
--       })
--
--       vim.api.nvim_create_autocmd({ "User" }, {
--         pattern = "PersistedTelescopeLoadPre",
--         group = group,
--         callback = function()
--           vim.cmd([[ScopeLoadState]])
--         end,
--       })
--
--       require("persisted").setup({
--         -- autosave = false,
--         -- NOTE: telescope extensions see telescope.lua
--       })
--     end,
--   },
-- }
-- return {
--   "jedrzejboczar/possession.nvim",
--   -- lazy = false,
--   event = "BufEnter",
--   -- cmd = {
--   --   "PossessionSave",
--   --   "PossessionLoad",
--   --   "PossessionRename",
--   --   "PossessionClose",
--   --   "PossessionDelete",
--   --   "PossessionShow",
--   --   "PossessionList",
--   --   "PossessionMigrate",
--   -- },
--   config = function()
--     require("possession").setup({
--       hooks = {
--         before_save = function()
--           vim.cmd([[ScopeSaveState]]) -- Scope.nvim saving
--         end,
--         before_load = function()
--           vim.cmd([[ScopeLoadState]]) -- Scope.nvim loading
--         end,
--       },
--       -- -- save_hook = function()
--       -- --   vim.cmd([[ScopeSaveState]]) -- Scope.nvim saving
--       -- -- end,
--       -- -- post_hook = function()
--       -- --   vim.cmd([[ScopeLoadState]]) -- Scope.nvim loading
--       -- -- end,
--       -- commands = {
--       --   save = "PossessionSave",
--       --   load = "PossessionLoad",
--       --   rename = "PossessionRename",
--       --   close = "PossessionClose",
--       --   delete = "PossessionDelete",
--       --   show = "PossessionShow",
--       --   list = "PossessionList",
--       --   migrate = "PossessionMigrate",
--       -- },
--     })
--   end,
-- }
-- return {
--   "gennaro-tedesco/nvim-possession",
--   event = "BufReadPre",
--   dependencies = {
--     "ibhagwan/fzf-lua",
--   },
--   init = function()
--     local possession = require("nvim-possession")
--     vim.keymap.set("n", "<leader>sl", function()
--       possession.list()
--     end)
--     vim.keymap.set("n", "<leader>sn", function()
--       possession.new()
--     end)
--     vim.keymap.set("n", "<leader>su", function()
--       possession.update()
--     end)
--     vim.keymap.set("n", "<leader>sd", function()
--       possession.delete()
--     end)
--   end,
--   config = function()
--     require("nvim-possession").setup({
--       autoswitch = {
--         enable = true,
--       },
--       save_hook = function()
--         vim.cmd([[ScopeSaveState]]) -- Scope.nvim saving
--       end,
--       post_hook = function()
--         vim.cmd([[ScopeLoadState]]) -- Scope.nvim loading
--       end,
--     })
--   end,
-- }
