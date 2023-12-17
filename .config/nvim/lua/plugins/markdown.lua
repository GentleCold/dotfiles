return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    keys = {
      { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown preview" },
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      -- function OpenMarkdownPreview(url)
      --   vim.fn.system("firefox --new-window " .. url)
      -- end
      --
      -- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
    end,
  },
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify" },
    keys = {
      { "<leader>p", "<cmd>Pastify<cr>", desc = "Pastify" },
    },
    config = function()
      require("pastify").setup({
        opts = {
          -- apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
          local_path = "/imgs/",
        },
        ft = {
          markdown = '<img src="$IMG$" width="50%"/>',
        },
      })
    end,
  },
  { "h-hg/fcitx.nvim", ft = { "markdown" } },
}
