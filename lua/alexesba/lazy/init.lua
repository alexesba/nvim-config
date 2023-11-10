local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- bootstrap lazy.nvim
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local lazy = require('lazy')

if (lazy) then
  lazy.setup({
    spec = {
      -- Ad LazyVim and import its plugins
      { 'LazyVim/LazyVim' },
      -- import our plugins
      { import = 'alexesba.lazy.plugins' },
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    }
  })
end
