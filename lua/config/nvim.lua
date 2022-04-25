local set = vim.opt
set.number = true
set.cp = false
set.hidden = true
set.expandtab = true
set.backup = false
set.wrap = false
set.writebackup = false
set.autoindent = true
set.hlsearch = true
set.incsearch = true
set.showmatch = true
set.backspace = { 'indent','eol','start' }
set.laststatus = 2
set.ruler = true
set.listchars = {
  eol = '$',
  extends = '>',
  precedes = '<',
  tab = '>-',
  trail = '~'
}
set.swapfile = true
set.synmaxcol = 150
set.cursorline = true
set.signcolumn = 'yes'
set.termguicolors = true

set.diffopt:append { 'vertical' }

vim.g.mapleader = ","

vim.g.table_mode_corner = '+'
vim.g.enable_italic_font = 1
vim.inccommand='nosplit'

