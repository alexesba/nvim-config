" Colorscheme

" Set The Leader Key:
let mapleader=","

" set noerrorbells
set number
set hidden
" Some servers have issues with backup files, see #649.
set expandtab
set nobackup
set nowrap
set nowritebackup
"set cmdheight=2
set autoindent
set hlsearch
set incsearch
set showmatch
set backspace=indent,eol,start
set laststatus=2
set ruler
" No swap files
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set noswapfile
set synmaxcol=281
set cursorline

set signcolumn=yes

" Config for neovim
if (has("termguicolors"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" " Configure the diff tool vertical
set diffopt+=vertical
" set pumblend=20

"Configure table mode for github
let g:table_mode_corner = '+'

" Enable italic fonts
let g:enable_italic_font = 1
