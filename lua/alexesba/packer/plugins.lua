local tagalog_file_types = { 'javascriptreact', 'html', 'eruby', 'haml', }
local markdown_file_types = { 'md', 'markdown' }
local emmet_file_types = { 'html', 'erb', 'javascriptreact' }
local packer = Prequire('packer');

if (packer) then
  packer.init({
    max_jobs = 5
  })
  packer.startup(function(use)
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
    use { 'lukoshkin/highlight-whitespace' }
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
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require('nvim-treesitter.install')
        if (ts_update) then
          ts_update.update({ with_sync = true })
        end
      end,
    }
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      after = "nvim-treesitter",
    }
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    }
    use {
      'windwp/nvim-ts-autotag',
      after = 'nvim-ts-context-commentstring',
    }
    use {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    }
    use { 'weilbith/nvim-code-action-menu' }
    use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }

    use { 'alvarosevilla95/luatab.nvim' }
    use { 'rgroli/other.nvim' }
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig'
    }

    use {
      'dcampos/nvim-snippy',
      requires = { 'honza/vim-snippets' }
    }

    -- Color schemes
    use {
      'embark-theme/vim',
      'folke/tokyonight.nvim',
      'mhartington/oceanic-next',
      'rafamadriz/neon',
      'rakr/vim-one',
      'sainnhe/edge',
      'sainnhe/gruvbox-material',
      'sainnhe/sonokai',
      'savq/melange-nvim',
      'shatur/neovim-ayu',
      'yonlu/omni.vim',
    }

    if PackerBootstrap then
      packer.sync()
    end
  end)
end
