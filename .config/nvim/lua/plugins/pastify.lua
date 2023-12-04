return {
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify" },
    config = function()
      require("pastify").setup({
        opts = {
          apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
          local_path = "/imgs/",
        },
        ft = {
          markdown = "![]($IMG$)",
        },
      })
    end,
  },
}
