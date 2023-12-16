return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      -- config
      theme = "doom",
      config = {
        header = {
          "                                 ",
          "                                 ",
          "                                 ",
          "                                 ",
          "           ▄ ▄                   ",
          "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
          "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
          "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
          "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
          "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
          "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
          "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
          "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
          "                                 ",
          "                                 ",
          "                                 ",
          "                                 ",
        },
        center = {
          { action = "SessionManager load_session", icon = "  ", desc = "Select Session", key = "s" },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
