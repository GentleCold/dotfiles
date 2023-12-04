-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>")

-- Markdown preview
keymap.set("n", "<leader>cp", "<Plug>MarkdownPreview")

-- Paste img
keymap.set("n", "<leader>p", "<cmd>Pastify<cr>")

-- Leetcode
keymap.set("n", "<leader>cc", "<cmd>Leet console<cr>")
keymap.set("n", "<leader>ci", "<cmd>Leet desc<cr>")
keymap.set("n", "<leader>c<tab>", "<cmd>Leet tabs<cr>")

-- Accelerated jk
keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
