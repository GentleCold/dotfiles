return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "BufEnter",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle neotree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "single",
      disable_statusline = true,
      sources = { "filesystem" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["l"] = "into",
            ["<bs>"] = "",
            ["h"] = "navigate_up",
            ["g"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              elseif node.type == "file" then
                local file_path = node:get_id()
                -- reuse built-in commands to open and clear filter
                local cmds = require("neo-tree.sources.filesystem.commands")
                cmds.open(state)
                cmds.clear_filter(state)
                -- reveal the selected file without focusing the tree
                ---@diagnostic disable-next-line: missing-parameter
                require("neo-tree.sources.filesystem").navigate(state, state.path, file_path)
              end
            end,
          },
        },
        commands = {
          into = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- vim.cmd("cd " .. path)
            vim.cmd("Neotree " .. path)
          end,
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "✚",
            deleted = "",
            modified = "",
            renamed = "󰁕",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
      auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
    })
  end,
}
