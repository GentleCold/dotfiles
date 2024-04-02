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
          markdown = '<p align="center">\n<img src="$IMG$"/>\n</p>',
        },
      })
    end,
  },
  { "h-hg/fcitx.nvim", ft = { "markdown" } },
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}
