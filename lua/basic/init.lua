require('core.options')

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyVim', { clear = true }),
  pattern = 'VeryLazy',
  callback = function()
    require('core.functions')
    require('core.commands')
    require('core.mappings')
    require('core.augroups')
    require('core.statusLine')
    require('basic.linters')
    require('utils.autoreload')
  end,
})
require('basic.lazy')
