return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local logo = [[
          (`-.           _   .-')    
        _(OO  )_        ( '.( OO )_  
    ,--(_/   ,. \ ,-.-') ,--.   ,--.)
    \   \   /(__/ |  |OO)|   `.'   | 
     \   \ /   /  |  |  \|         | 
      \   '   /,  |  |(_/|  |'.'|  | 
       \     /__),|  |_.'|  |   |  | 
        \   /   (_|  |   |  |   |  | 
         `-'      `--'   `--'   `--' 



    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    require("dashboard").setup({
      -- config
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "         _________ _______ ",
        --   "|\\     /|\\__   __/(       )",
        --   "| )   ( |   ) (   | () () |",
        --   "| |   | |   | |   | || || |",
        --   "( (   ) )   | |   | |(_)| |",
        --   " \\ \\_/ /    | |   | |   | |",
        --   "  \\   /  ___) (___| )   ( |",
        --   "    \\_/   \\_______/|/     \\|",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        --   "                                 ",
        -- },
        center = {
          { action = "SessionManager load_session", icon = "  ", desc = "Select Session", key = "s" },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
          {
            action = "qa",
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
        footer = function()
          -- local stats = require("lazy").stats()
          -- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "" }
        end,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
