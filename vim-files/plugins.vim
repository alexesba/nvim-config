" Colorscheme
" cSpell:disable

" light and dark themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'scheakur/vim-scheakur'
Plug 'mkarmona/materialbox'
Plug 'tomasiser/vim-code-dark'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'

" Vim Editor enhancers
" Vim Tab style
Plug 'mkitt/tabline.vim'
" tcomment provides easy to use, file-type sensible comments for Vim. It
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch' "Delete files using commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
" This is a massive (in a good way) Vim plugin for editing Ruby on Rails applications.
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-cucumber', { 'for': 'feature' }
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }

Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
"
" Javascript syntax and highlight
Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }
" Plug 'chemzqm/vim-jsx-improve', { 'for': ['jsx', 'js'] }
Plug 'mgechev/vim-jsx'

"Make Vim handle line and column numbers in file names with a minimum of fuss
"vim path/to/file.ext:12:3 in the shell to open file.ext on line 12 at column 3
Plug 'kopischke/vim-fetch'

" match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
" It extends vim's % key to language-specific words instead of just single characters.
Plug 'andymass/vim-matchup'
"Intelligently reopen files at your last edit position in Vim. https://www.gregd.org/
Plug 'dietsche/vim-lastplace'

Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim', { 'for': ['jsx', 'js', 'html', 'haml'] }

Plug 'terryma/vim-multiple-cursors'

"which" and 'exec' functions targeted at local node project bin, with 'which' fallback
Plug 'alexesba/nrun.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" This plugin causes all trailing whitespace characters to be highlighted.
Plug 'ntpeters/vim-better-whitespace'

" An awesome automatic table creator & formatter allowing one to create neat tables as you type.
Plug 'dhruvasagar/vim-table-mode'

" Plugin to load the .editorconfig rules
Plug 'editorconfig/editorconfig-vim'

"Plug 'nightsense/night-and-day'

Plug 'mbbill/undotree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lambdalisue/fern.vim'

"Automatically create and load views
Plug 'senderle/restoreview'

Plug 'airblade/vim-gitgutter'

if !empty(glob("~/.plug.vim"))
  so ~/.plug.vim
endif
