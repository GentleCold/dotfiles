return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = { enabled = false },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
