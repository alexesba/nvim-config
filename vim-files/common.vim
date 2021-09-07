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

let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-solargraph',
      \ 'coc-stylelintplus',
      \ 'coc-tsserver',
      \ 'coc-markdownlint',
      \ 'coc-spell-checker',
      \ 'coc-yaml',
      \ 'coc-explorer'
      \]

let g:coc_filetype_map = {
      \ 'rspec.ruby': 'ruby',
      \ }

" highlight only the tags names for ruby
" and js

let g:matchup_matchpref = {
      \ 'eruby':  { 'tagnameonly': 1, },
      \ 'html': { 'tagnameonly': 1, },
      \}

" for jsx we need a special matcher function
let g:matchup_hotfix_javascriptreact = 'JsxHotfix'
let g:matchup_hotfix_javascript = 'JsxHotfix'

"Configure table mode for github
let g:table_mode_corner = '+'

" Enable italic fonts
let g:enable_italic_font = 1
