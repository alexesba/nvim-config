call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/custom/plugins.vim
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

"set the color scheme
:silent! colorscheme moria
:silent! set background=light

if exists('+colorcolumn')
  set colorcolumn=80
endif

if exists('g:GuiLoaded')
  let g:Guifont="Operator Mono:h13"
endif

if has("autocmd")
  filetype plugin indent on
end

if has('nvim')
  runtime! plugin/python_setup.vim
endif

" Config for neovim
if (has("termguicolors"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

"Configure table mode for github
let g:table_mode_corner = '+'

" Configure jsx files for javascript
let g:jsx_ext_required = 0 "Allow jsx in normal js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Enable italic fonts
let g:enable_italic_font = 1
let g:netrw_dirhistmax = 0

" Configure Preview for Markdown files
let vim_markdown_preview_toggle=3
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

so ~/.config/nvim/custom/highlight_trail_spaces.vim
so ~/.config/nvim/custom/functions.vim
so ~/.config/nvim/custom/mappings.vim
so ~/.config/nvim/custom/linters.vim
so ~/.config/nvim/custom/commands.vim
so ~/.config/nvim/custom/italic_fonts.vim
so ~/.config/nvim/custom/status_bar.vim
so ~/.config/nvim/custom/fuzzyfinder.vim
so ~/.config/nvim/custom/grammar_checker.vim
call SourceIfExists("~/.vimrc")
