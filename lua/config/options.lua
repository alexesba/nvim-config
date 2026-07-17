-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Personal overrides: lua/config/options.local.lua (gitignored; see options.local.lua.example)
local load_local = require("utils.local").load
local set = vim.opt

vim.o.winborder = "rounded"
set.colorcolumn = "81"
set.listchars = {
  eol = "$",
  extends = ">",
  precedes = "<",
  tab = ">-",
  trail = "~",
}
set.synmaxcol = 150
set.diffopt:append({ "vertical" })
set.list = false
set.updatetime = 500 -- ms before CursorHold fires (affects diagnostic float speed)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

load_local("leader")

vim.g.table_mode_corner = "+"
vim.g.enable_italic_font = 1
vim.inccommand = "nosplit"

load_local("options")
