return {
  "chentoast/marks.nvim",
  event = "BufRead",
  config = function()
    require("marks").setup({})
  end,
}
