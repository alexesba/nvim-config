" Colorscheme
" cSpell:disable

"{{ colorSchemes: light and dark themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'mkarmona/materialbox'
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'scheakur/vim-scheakur'
Plug 'tomasiser/vim-code-dark'
Plug 'ayu-theme/ayu-vim' 
"}}}

"{{ Vim Editor enhancers:
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-gitgutter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'kopischke/vim-fetch'
Plug 'mbbill/undotree'
Plug 'mkitt/tabline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"}}}

"{{ Syntax and highlight
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'mattn/emmet-vim', { 'for': ['jsx', 'js', 'html', 'haml'] }
Plug 'mgechev/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }
Plug 'senderle/restoreview'
Plug 'tpope/vim-cucumber', { 'for': 'feature' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
"}}}

"{{ Configuration tools:
Plug 'alexesba/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
"}}

"{{ Linter tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"}}

"{{ Search tools:
Plug 'lambdalisue/fern.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
"}}



if !empty(glob("~/.plug.vim"))
  so ~/.plug.vim
endif
