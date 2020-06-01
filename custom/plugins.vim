" Colorscheme
Plug 'alexesba/colors'
Plug 'mhartington/oceanic-next'

" Vim Editor enhancers
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'avakhov/vim-yaml', {'for': 'yml'}
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
"
" Javascript syntax and highlight
Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }

Plug 'chemzqm/vim-jsx-improve', { 'for': ['jsx', 'js'] }

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

"Tools for searching
"A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"A command-line fuzzy finder vim integration
Plug 'junegunn/fzf.vim'

"Linter plugins
"which" and 'exec' functions targeted at local node project bin, with 'which' fallback
Plug 'jaawerth/nrun.vim'
" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake', { 'on': 'NeoMake', 'for': ['javascript', 'ruby', 'scss', 'css', 'sass'] }

"Using the markdown-preview.vim plugin, you can preview Markdown in real-time with a web browser.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" This plugin causes all trailing whitespace characters to be highlighted.
Plug 'ntpeters/vim-better-whitespace'

" An awesome automatic table creator & formatter allowing one to create neat tables as you type.
Plug 'dhruvasagar/vim-table-mode'

" Plugin to load the .editorconfig rules
Plug 'editorconfig/editorconfig-vim'

Plug 'nightsense/night-and-day'


if !empty(glob("~/.plug.vim"))
    so ~/.plug.vim
endif
