local columnLimit = vim.api.nvim_create_augroup(
  'columnLimit', { clear = true }
)

vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufEnter' }, {
    command = [[
   highlight ColumnLimit ctermbg=Red guibg=Red
  ]],
    group = columnLimit
  })
