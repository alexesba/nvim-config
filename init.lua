require('packerBootstrap')
return require('packer').startup(function(use)
  require('config.nvim')
  require('plugins').init(use)
  require('config.commands')
  require('config.mappings')
  require('config.augroups')
  -- TODO: refactor vim script functions
  vim.cmd [[
  so ~/.config/nvim/vim-files/functions/custom.vim
  so ~/.config/nvim/vim-files/marp.vim
  ]]
  -- Autorelaod config file after update
  require('autoreload')
end)
