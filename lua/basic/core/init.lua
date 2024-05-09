require('basic.core.options')
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyVim', { clear = true }),
  pattern = 'VeryLazy',
  callback = function()
    require('basic.core.functions')
    require('basic.core.commands')
    require('basic.core.mappings')
    require('basic.core.augroups')
    require('basic.core.statusLine')
    require('basic.linters')
    require('basic.utils.autoreload')
  end,
})
