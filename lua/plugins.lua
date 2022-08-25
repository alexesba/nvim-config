local Plugins = {};
Plugins.init = function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'ayu-theme/ayu-vim' }

  use { 'lourenci/github-colors' }

  use { 'sainnhe/sonokai' }

  use { 'mhartington/oceanic-next' }

  use { 'rafamadriz/neon' }

  use { 'projekt0n/github-nvim-theme' }

  use { 'rakr/vim-one' }

  use { 'phanviet/vim-monokai-pro' }

  use { 'dhruvasagar/vim-table-mode'}

  use { 'dietsche/vim-lastplace'}

  use { 'godlygeek/tabular'}

  use { 'skywind3000/asyncrun.vim'}

  use { 'kopischke/vim-fetch'}

  use { 'mg979/vim-visual-multi'}

  use { 'tpope/vim-repeat' }

  use { 'tpope/vim-surround' }

  use { 'tpope/vim-dispatch' }

  use { 'tpope/vim-eunuch' }

  use { 'tpope/vim-abolish' }

  use { 'tpope/vim-fugitive' }

  use { 'tpope/vim-bundler' }

  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  use { 'nvim-telescope/telescope.nvim' }

  use {
    'andymass/vim-matchup',
    config = function()
      require('config.plugins.matchup')
    end
  }

  use {
    'AndrewRadev/tagalong.vim',
    ft = { 'javascriptreact', 'html', 'eruby', 'haml' }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.plugins.gitsigns')
    end
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = {'md', 'markdown' }
  }

  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('config.plugins.komentary')
    end
  }

  use {
    'fedepujol/move.nvim',
    config = function()
      require('config.plugins.move')
    end
  }

  use { 'mattn/emmet-vim', ft = { 'html', 'erb', 'javascriptreact' } }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('config.plugins.colorizer')
    end
  }

  use { 'juanchanco/vim-jbuilder', fty = 'jbuilder' }

  use { 'shmup/vim-sql-syntax', ft = 'sql'  }

  use { 'alexesba/nrun.vim' }

  use { 'editorconfig/editorconfig-vim' }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.statusLine')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.plugins.nvimtree')
    end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('config.plugins.terminal')
    end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('config.plugins.compe')
    end
  }

  use {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
      require('config.plugins.cursorhold')
    end
  }

  use {
    'weilbith/nvim-code-action-menu',
    config = function()
      require('config.plugins.codeActionMenu')
    end
  }

  use { 'nvim-lua/popup.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.plugins.treesitter')
    end
  }

  use {
    'alvarosevilla95/luatab.nvim',
    requires='kyazdani42/nvim-web-devicons',
    config = function()
      require('config.plugins.luatab')
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
      require('config.linters.cssls');
      require('config.linters.cucumber')
      require('config.linters.elixir');
      require('config.linters.eslint')
      require('config.linters.html')
      require('config.linters.jsonls')
      require('config.linters.lualanguageserver')
      require('config.linters.solargraph')
      require('config.linters.sqlls')
      require('config.linters.stylelint_lsp')
      require('config.linters.tsserver')
    end
  }
  if PackerBootstrap then
    require('packer').sync()
  end
end

return Plugins
