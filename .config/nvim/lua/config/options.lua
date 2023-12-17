-- My awesome options
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
