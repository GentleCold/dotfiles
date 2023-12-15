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
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
    -- { "gd", "<cmd>Telescope lsp_definitions<cr>" },
    -- { "gi", "<cmd>Telescope lsp_implementations<cr>" },
    -- { "gr", "<cmd>Telescope lsp_references<cr>" },
    { "<leader>fT", "<cmd>Telescope diagnostics<cr>" },
  },
  tag = "0.1.5",
  config = function()
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
      },
    })
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
