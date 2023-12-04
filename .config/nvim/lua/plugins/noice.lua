return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false,
        },
      },
      views = {
        mini = {
          timeout = 1000,
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
}
