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

if has("autocmd")
  syntax on
  filetype plugin indent on
end

" Config for neovim
if (has("termguicolors"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" Configure the diff tool vertical
set diffopt+=vertical
