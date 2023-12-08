-- neovide
if vim.g.neovide then
  -- cursor animation
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- font
  vim.o.guifont = "Maple Mono SC NF:h9"
  vim.opt.linespace = -1
  -- transparency
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_hide_mouse_when_typing = true
  -- reduce performance when idle
  vim.g.neovide_refresh_rate_idle = 5
end

-- options
local opt = vim.opt
opt.clipboard = "unnamedplus"

-- keymaps
local map = vim.keymap
map.set("i", "jk", "<ESC>")
map.set("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit all" })
