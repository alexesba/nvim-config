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
set cmdheight=2
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
set nowb
set synmaxcol=2048

set signcolumn=yes

" Config for neovim
if (has("termguicolors"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" " Configure the diff tool vertical
set diffopt+=vertical
" set pumblend=20

let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-solargraph',
      \ 'coc-stylelintplus',
      \ 'coc-tsserver',
      \ 'coc-markdownlint',
      \ 'coc-spell-checker',
      \ 'coc-yaml'
      \]

autocmd BufWritePost * GitGutter
