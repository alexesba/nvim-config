vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' }, {
    pattern = { "*.arb" },
    command = "setfiletype ruby"
  })

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead', 'BufEnter' }, {
    pattern = { "*.jbuilder" },
    command = "setf jbuilder"
  });
