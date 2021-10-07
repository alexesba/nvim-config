" Colorscheme
" cSpell:disable

"{{ colorSchemes: light and dark themes
Plug 'alexesba/ayu-vim'
Plug 'sainnhe/sonokai'
Plug 'lourenci/github-colors'
Plug 'mhartington/oceanic-next'
Plug 'rafamadriz/neon'
"}}}

"{{ Vim Editor enhancers:
Plug 'andymass/vim-matchup'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'kopischke/vim-fetch'
Plug 'mbbill/undotree'
Plug 'mkitt/tabline.vim'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"}}}

"{{ Syntax and highlight
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-cucumber', { 'for': 'feature' }
Plug 'juanchanco/vim-jbuilder', { 'for': 'jbuilder' }
"}}}

"{{ Configuration tools:
Plug 'alexesba/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
"}}

"{{ Linter tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"}}

"{{ Search tools:
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
"}}



if !empty(glob("~/.plug.vim"))
  so ~/.plug.vim
endif
