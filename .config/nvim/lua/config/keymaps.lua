-- My awesome keymaps
local map = vim.keymap

-- General
map.set("i", "jk", "<ESC>")
map.set("i", "<C-j><C-k>", "<ESC>")
map.set({ "n", "v" }, "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })

vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end
map.set("n", "<Leader>ad", ":call v:lua.toggle_diagnostics()<CR>", { silent = true, noremap = true })

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
map.set("n", "<leader>bd", "<cmd>BufferClose<cr>", { desc = "Delete buffer" })
map.set("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin buffer" })
map.set("n", "<leader>bD", "<cmd>BufferCloseAllButPinned<cr>", { desc = "Delete all buffers" })

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

-- Tabs
map.set("n", "<leader><tab>n", "<cmd>Neotree close<cr><cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>l", "<cmd>Neotree close<cr><cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>h", "<cmd>Neotree close<cr><cmd>tabprevious<cr>", { desc = "Previous Tab" })
map.set("n", "<leader><tab>d", "<cmd>Neotree close<cr><cmd>tabclose<cr>", { desc = "Close Tab" })

-- UI
map.set("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Lazy" })
map.set("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Mason" })

-- Neotree
map.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })

-- Toggle auto Save
map.set("n", "<leader>as", ":ASToggle<CR>", {})

-- Accelerated jk
map.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
map.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
