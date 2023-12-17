-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- files
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },

    -- lsp
    { "<leader>fs", "<cmd>Telescope treesitter<cr>" },
    -- { "gd", "<cmd>Telescope lsp_definitions<cr>" },
    -- { "gi", "<cmd>Telescope lsp_implementations<cr>" },
    -- { "gr", "<cmd>Telescope lsp_references<cr>" },
    { "<leader>fT", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>fi", "<cmd>Telescope lsp_incoming_calls<cr>" },
    { "<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>" },

    -- sessions
    -- { "<leader>s", "<cmd>Telescope persisted<cr>", desc = "Find Session" },
    -- { "<leader>s", "<cmd>Telescope possession list<cr>", desc = "Find Session" },
  },
  tag = "0.1.5",
  config = function()
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    local actions = require("telescope.actions")
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            ["<C-u>"] = false,
          },
          n = {
            ["q"] = actions.close,
          },
        },
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    -- Load extensions
    require("telescope").load_extension("fzf")
    -- require("telescope").load_extension("persisted")
    -- require("telescope").load_extension("possession")

    local TelescopePrompt = {
      TelescopePromptBorder = {
        fg = "#C5CDD9",
      },
      TelescopeResultsBorder = {
        fg = "#C5CDD9",
      },
      TelescopePreviewBorder = {
        fg = "#C5CDD9",
      },
    }
    for hl, col in pairs(TelescopePrompt) do
      vim.api.nvim_set_hl(0, hl, col)
    end
  end,
}
