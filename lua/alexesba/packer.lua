local tagalog_file_types = { 'javascriptreact', 'html', 'eruby', 'haml', }
local markdown_file_types = { 'md', 'markdown' }
local emmet_file_types = { 'html', 'erb', 'javascriptreact' }

require('packer').startup(function(use)
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'aca/marp.nvim', ft = { 'md', 'markdown' } }
  use { 'andymass/vim-matchup' }
  use { 'brymer-meneses/grammar-guard.nvim' }
  use { 'dhruvasagar/vim-table-mode' }
  use { 'dietsche/vim-lastplace' }
  use { 'godlygeek/tabular' }
  use { 'kopischke/vim-fetch' }
  use { 'mg979/vim-visual-multi' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'rorymckinley/vim-rubyhash', ft = { 'erb', 'ruby' } }
  use { 'skywind3000/asyncrun.vim' }
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use {
    'tpope/vim-abolish',
    'tpope/vim-bundler',
    'tpope/vim-dispatch',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
  }
  use { 'AndrewRadev/tagalong.vim', ft = tagalog_file_types }
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = markdown_file_types
  }

  use { 'b3nj5m1n/kommentary' }
  use { 'juanchanco/vim-jbuilder', ft = 'jbuilder' }
  use { 'shmup/vim-sql-syntax', ft = 'sql' }
  use { 'mattn/emmet-vim', ft = emmet_file_types }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'alexesba/nrun.vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'akinsho/toggleterm.nvim' }
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline'
  }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'weilbith/nvim-code-action-menu' }
  use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    run = ':TSUpdate'
  }
  use { 'alvarosevilla95/luatab.nvim' }
  use { 'rgroli/other.nvim' }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }

  -- Color schemes
  use {
    'Shatur/neovim-ayu',
    'folke/tokyonight.nvim',
    'lourenci/github-colors',
    'mhartington/oceanic-next',
    'phanviet/vim-monokai-pro',
    'projekt0n/github-nvim-theme',
    'rafamadriz/neon',
    'rakr/vim-one',
    'sainnhe/gruvbox-material',
    'sainnhe/sonokai',
  }

  if PackerBootstrap then
    require('packer').sync()
  end
end)
