" Colorscheme
" cSpell:disable

"{{ colorSchemes: light and dark themes
Plug 'alexesba/ayu-vim'
Plug 'lourenci/github-colors'
Plug 'sainnhe/sonokai'
Plug 'mhartington/oceanic-next'
Plug 'rafamadriz/neon'
Plug 'projekt0n/github-nvim-theme'
Plug 'rakr/vim-one'
Plug 'phanviet/vim-monokai-pro'
"}}}

"{{ Vim Editor enhancers:
Plug 'andymass/vim-matchup'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'skywind3000/asyncrun.vim'
Plug 'kopischke/vim-fetch'
Plug 'mkitt/tabline.vim'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
"}}}

"{{ Syntax and highlight
Plug 'norcalli/nvim-colorizer.lua'
Plug 'juanchanco/vim-jbuilder', { 'for': 'jbuilder' }
Plug 'shmup/vim-sql-syntax', { 'for': 'sql'  }
"}}}

"{{ Configuration tools:
Plug 'alexesba/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
"}}

"{{ Linter tools
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'weilbith/nvim-code-action-menu'
"}}

"{{ Search tools:
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'commit': '668de0951a36ef17016074f1120b6aacbe6c4515'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
"}}



if !empty(glob("~/.plug.vim"))
  so ~/.plug.vim
endif
