require('alexesba.core.options')
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyVim', { clear = true }),
  pattern = 'VeryLazy',
  callback = function()
    require('alexesba.core.functions')
    require('alexesba.core.commands')
    require('alexesba.core.mappings')
    require('alexesba.core.augroups')
    require('alexesba.core.statusLine')
    require('alexesba.linters')
    require('alexesba.utils.autoreload')
  end,
})
