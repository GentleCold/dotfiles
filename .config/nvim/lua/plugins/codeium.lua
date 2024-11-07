return {
  {
    "Exafunction/codeium.vim",
    -- disabled by default because it's not usefull and take up sources
    enabled = "false",
    -- event = "BufReadPre",
    version = "1.8.37",
    config = function()
      vim.g.codeium_disable_bindings = 1
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<A-i>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<A-n>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<A-p>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<A-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })

      -- 定义自定义命令 :CodeiumChat
      vim.api.nvim_create_user_command("CodeiumChat", function()
        vim.fn["codeium#Chat"]()
      end, {})
    end,
  },
}
