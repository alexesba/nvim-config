local columnLimit = vim.api.nvim_create_augroup(
"columnLimit", { clear = true }
)

vim.api.nvim_create_autocmd(
"BufRead,BufEnter", {
  command = [[
   highlight ColumnLimit ctermbg=Red guibg=Red
  ]],
  group = columnLimit
})

vim.api.nvim_create_autocmd(
"BufRead,BufEnter", {
  command = [[
  let w:m1=matchadd('ColumnLimit', '\%<' . (&colorcolumn+1) . 'v.\%>' . &colorcolumn . 'v' , -1)
  ]],
  group = columnLimit
}
)

local ReloadColorSchemes = vim.api.nvim_create_augroup(
"ReloadColorSchemes", { clear = true }
)

vim.api.nvim_create_autocmd(
"ColorScheme,VimEnter", {
  command = [[
  call g:ConfigItalicFonts()
  ]],
  group = ReloadColorSchemes
})

local ReloadVimrc = vim.api.nvim_create_augroup(
"ReloadVimrc", { clear = true }
)

vim.api.nvim_create_autocmd(
"BufWritePost", {
  pattern = {
    "*/.config/nvim/**/*.lua",
    "*/.config/nvim/vim-files/plugins.vim",
    "*/.vimrc",
  },
  command = "source $MYVIMRC | source %",
  group = ReloadVimrc
})