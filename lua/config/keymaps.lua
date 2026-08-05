-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Personal overrides: lua/config/keymaps.local.lua (gitignored; see keymaps.local.lua.example)
local map = require("utils.map").map

map("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Jump to a tab by number with Neovim's built-in {count}gt, e.g. 3gt -> tab 3

-- Remove newbie crutches in Normal Mode
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("n", "<Up>", "<Nop>")
map("n", "Q", "<Nop>")

-- Disable Arrow keys in Insert mode
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

-- Disable Arrow keys in Visual Mode
map("v", "<Down>", "<Nop>")
map("v", "<Left>", "<Nop>")
map("v", "<Right>", "<Nop>")
map("v", "<Up>", "<Nop>")

map("n", "<leader>yp", ":CopyFullPath<CR>", { noremap = true, silent = true })
map("n", "<leader>yr", ":CopyRelativePath<CR>", { noremap = true, silent = true })

-- Copy from cursor to the end of the line
map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Undo break points
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "-", "-<C-g>u")
map("i", "_", "_<C-g>u")
map("i", ":", ":<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")

-- Jumplist Mutations:
map("n", "k", [[(v:count > 5 ? "m'". v:count : ""). 'k']], { expr = true, silent = true })
map("n", "j", [[(v:count > 5 ? "m'". v:count : ""). 'j']], { expr = true, silent = true })

map("n", "<leader>rp", [[:%s/<C-r><C-w>/]])

map("v", "J", [[:m '>+1<CR>gv=gv]])
map("v", "K", [[:m '<-2<CR>gv=gv]])

require("utils.local").load("keymaps")
