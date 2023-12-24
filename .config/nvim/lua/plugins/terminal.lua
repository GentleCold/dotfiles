return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- event = "BufEnter",
    keys = {
      { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      -- { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle float terminal" },
      -- { "<leader>t<tab>", "<cmd>ToggleTerm direction=tab<cr>", desc = "Toggle tab terminal" },
    },
    opts = {
      open_mapping = [[<c-\>]],
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      function _G.set_terminal_keymaps()
        local opt = { buffer = 0 }
        -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opt)
        -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opt)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n>]], opt)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
