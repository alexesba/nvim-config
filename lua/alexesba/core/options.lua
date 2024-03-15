local set = vim.opt
set.number = true
set.relativenumber = true
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
set.backspace = { 'indent', 'eol', 'start' }
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
set.colorcolumn = '81'
set.updatetime = 100
set.diffopt:append { 'vertical' }
vim.g.mapleader = ','
vim.g.table_mode_corner = '+'
vim.g.enable_italic_font = 1
vim.inccommand = 'nosplit'

set.wildignore:append({
  'blue.vim', 'darkblue.vim', 'default.vim', 'delek.vim', 'desert.vim',
  'elflord.vim', 'evening.vim', 'industry.vim', 'koehler.vim', 'morning.vim',
  'murphy.vim', 'pablo.vim', 'peachpuff.vim', 'ron.vim', 'shine.vim', 'slate.vim',
  'torte.vim', 'zellner.vim'
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
