--   ___  ____ _____ ___ ___  _   _ ____
--  / _ \|  _ \_   _|_ _/ _ \| \ | / ___|
-- | | | | |_) || |  | | | | |  \| \___ \
-- | |_| |  __/ | |  | | |_| | |\  |___) |
--  \___/|_|    |_| |___\___/|_| \_|____/
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.encoding = "utf-8"

local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.autowrite = true
opt.autoread = true

opt.completeopt = "menu,menuone,noselect" -- completion options

opt.expandtab = true -- use spaces instead of tabs
opt.tabstop = 2 -- 2 spaces for indent
opt.shiftround = true -- round indent to multiple of 'shiftwidth'
opt.shiftwidth = 2 -- 2 spaces for indent

opt.undofile = true -- enable persistent undo
opt.undolevels = 10000

opt.ignorecase = true -- ignore case
opt.mouse = "a" -- enable mouse
opt.spelllang = { "en", "cjk" } -- spell languages
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers

opt.list = false -- show some invisible characters
opt.confirm = true -- confirm to save changes

opt.smartcase = true
opt.smartindent = true

opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitkeep = "screen" -- keep the cursor in the same column
opt.splitright = true -- force all vertical splits to go to the right of current window

opt.termguicolors = true

opt.virtualedit = "block" -- allow cursor to move where there is no text
opt.cursorline = true -- highlight the current line
opt.wrap = false -- do not wrap lines

opt.updatetime = 250
-- opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete

-- opt.wildmenu = true -- show list instead of just completing
-- opt.shortmess = vim.o.shortmess .. 'c' -- don't give |ins-completion-menu| messages

opt.pumheight = 10 -- pop up menu height
opt.showtabline = 1 -- always show tabs
opt.showmode = false

opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

opt.signcolumn = "yes"
-- opt.numberwidth = 3
opt.laststatus = 3
opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize,localoptions"
-- vim.g.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,global"

vim.g.markdown_folding = 1 -- enable markdown folding
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--  _  _________   ____  __    _    ____  ____
-- | |/ / ____\ \ / /  \/  |  / \  |  _ \/ ___|
-- | ' /|  _|  \ V /| |\/| | / _ \ | |_) \___ \
-- | . \| |___  | | | |  | |/ ___ \|  __/ ___) |
-- |_|\_\_____| |_| |_|  |_/_/   \_\_|   |____/
local map = vim.keymap

-- General
map.set("i", "jk", "<ESC>")
map.set("i", "<C-j><C-k>", "<ESC>")
map.set({ "n", "v" }, "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Better move
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map.set("i", "<C-e>", "<End>", { desc = "End of line" })

map.set("i", "<C-h>", "<Left>", { desc = "Left" })
map.set("i", "<C-l>", "<Right>", { desc = "Right" })
map.set("i", "<C-j>", "<Down>", { desc = "Down" })
map.set("i", "<C-k>", "<Up>", { desc = "Up" })

map.set("i", "<C-p>", "<esc>p")

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map.set("n", "<S-h>", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })
map.set("n", "<S-l>", "<cmd>BufferNext<cr>", { desc = "Next buffer" })
map.set("n", "<leader>bh", "<Cmd>BufferMovePrevious<CR>")
map.set("n", "<leader>bl", "<Cmd>BufferMoveNext<CR>")
map.set("n", "<A-w>", "<cmd>BufferClose<cr>", { desc = "Delete buffer" })
map.set("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin buffer" })
map.set("n", "<leader>bD", "<cmd>BufferCloseAllButPinned<cr>", { desc = "Delete all buffers" })

-- Goto buffer in position...
map.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true })
map.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true })
map.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true })
map.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true })
map.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true })
map.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true })
map.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true })
map.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true })
map.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true })
map.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map.set("n", "<space>ft", vim.diagnostic.setloclist)
map.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Clear search with <esc>
map.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- Windows
map.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })

