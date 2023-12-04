return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    config = function()
      require("accelerated-jk").setup({
        mode = "time_driven",
        enable_deceleration = false,
        acceleration_motions = {},
        acceleration_limit = 150,
        acceleration_table = { 10 },
      })
    end,
  },
}
