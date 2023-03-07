require('packer').startup(function(use)
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'wbthomason/packer.nvim' }
  use { 'rorymckinley/vim-rubyhash', ft = {'erb', 'ruby' } }
  use { 'aca/marp.nvim', ft = {'md', 'markdown' } }
  use { "brymer-meneses/grammar-guard.nvim" }
  use { 'Shatur/neovim-ayu' }
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
  use { 'andymass/vim-matchup' }
  use {
    'AndrewRadev/tagalong.vim',
    ft = { 'javascriptreact', 'html', 'eruby', 'haml' }
  }
  use { 'lewis6991/gitsigns.nvim' }
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = {'md', 'markdown' }
  }

  use { 'b3nj5m1n/kommentary' }
  use { 'fedepujol/move.nvim' }
  use { 'mattn/emmet-vim', ft = { 'html', 'erb', 'javascriptreact' } }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'juanchanco/vim-jbuilder', fty = 'jbuilder' }
  use { 'shmup/vim-sql-syntax', ft = 'sql'  }
  use { 'alexesba/nrun.vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'hrsh7th/nvim-compe' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'weilbith/nvim-code-action-menu' }
  use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
  use { 'rgroli/other.nvim' }
  use { 'neovim/nvim-lspconfig', }
  use({ 'rose-pine/neovim', as = 'rose-pine' })


  if PackerBootstrap then
    require('packer').sync()
  end
end)
