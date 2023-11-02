require('alexesba.base')
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
    require('alexesba.functions')
    require('alexesba.commands')
    require('alexesba.mappings')
    require('alexesba.augroups')
    require('alexesba.statusLine')
    require('alexesba.linters')
    require('alexesba.utils.autoreload')
  end,
})
require('alexesba.lazy')
