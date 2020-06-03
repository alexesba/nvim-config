call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

syntax on
filetype on
filetype plugin on
filetype indent on
set autoread " Auto reload file when it's changed in the background
au FocusGained * :checktime
set expandtab
set hlsearch
set incsearch
set nowrap
set number
" Show matching brackets and parentheses
set showmatch

" vim sensible
set autoindent
set backspace=indent,eol,start
set complete-=i
set laststatus=2
set ruler
set smarttab
set wildmenu

" No swap files
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nobackup
set noswapfile
set nowb
set synmaxcol=2048
set novisualbell

" set the color schemes
let g:nd_themes = [
      \ ['8:00',  'OceanicNext', '']
      \ ]

if exists('+colorcolumn')
  set colorcolumn=80
endif

if has("autocmd")
  filetype plugin indent on
end

" Config for neovim
if (has("termguicolors"))
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
   set termguicolors
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"Configure table mode for github
let g:table_mode_corner = '+'

" Configure jsx files for javascript
let g:jsx_ext_required = 0 "Allow jsx in normal js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Enable italic fonts
let g:enable_italic_font = 1

so ~/.config/nvim/vim-files/highlight_trail_spaces.vim
so ~/.config/nvim/vim-files/functions.vim
so ~/.config/nvim/vim-files/mappings.vim
so ~/.config/nvim/vim-files/linters.vim
so ~/.config/nvim/vim-files/commands.vim
so ~/.config/nvim/vim-files/italic_fonts.vim
" so ~/.config/nvim/vim-files/status_bar.vim
so ~/.config/nvim/vim-files/simple_status_bar.vim
so ~/.config/nvim/vim-files/fzf_colors.vim
so ~/.config/nvim/vim-files/fuzzyfinder.vim
so ~/.config/nvim/vim-files/autocomplete.vim
" so ~/.config/nvim/vim-files/grammar_checker.vim

if !empty(glob("~/.vimrc"))
 so ~/.vimrc
endif
