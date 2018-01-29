call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'alexesba/colors'
Plug 'mhartington/oceanic-next'

" utils
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch' "Delete files using commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown' "Preview markdown files
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kopischke/vim-fetch'
" Plug 'jiangmiao/auto-pairs'

Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'

"Tools for searching
Plug 'jaawerth/nrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Validate syntax and load configuration for editing files

Plug 'editorconfig/editorconfig-vim'
Plug 'neomake/neomake'
"Languages and syntax
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }
Plug 'avakhov/vim-yaml'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'chase/vim-ansible-yaml'
Plug 'digitaltoad/vim-jade'
Plug 'gko/vim-coloresque'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/xml.vim'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support

call plug#end()

syntax on
filetype on
filetype plugin on
filetype indent on
set autoread " Auto reload file when it's changed in the background
set expandtab
set hlsearch
set incsearch
set nowrap
set number
set showmatch " Show matching brackets and parentheses
au FocusGained * :checktime

" vim sensible
set laststatus=2
set ruler
set wildmenu
set backspace=indent,eol,start
set complete-=i
set smarttab
set autoindent

" No swap files
set noswapfile
set nobackup
set nowb
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

if exists('+colorcolumn')
  set colorcolumn=80
endif

let mapleader=","
map <leader>n :NERDTreeToggle <cr>
map <Space> :noh<cr>

" check one time after 4s of inactivity in normal mode
nmap <leader>fef :normal! gg=G``<CR>

"Toogle comments
nmap <silent> <Leader>c :TComment<CR>
vmap <silent> <Leader>c :TComment<CR>
imap <silent> <Leader>c <Esc>:TComment<CR>i

"Using FZF as file search
nmap <silent> <Leader>f :FZF<CR>

" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-0> :tabn 0<cr>
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Command to move among tabs in Konsole-style
map <leader>1 :tabn 1 <cr>
map <leader>2 :tabn 2 <cr>
map <leader>3 :tabn 3 <cr>
map <leader>4 :tabn 4<cr>
map <leader>5 :tabn 5<cr>
map <leader>6 :tabn 6<cr>
map <leader>7 :tabn 7<cr>
map <leader>8 :tabn 8<cr>
map <leader>9 :tabn 9<cr>
map <leader>0 :tabn 0<cr>

colorscheme moria
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Mapping to move single line in normal mode and move blocks in visual mode
nmap <M-Up>   :<C-u>silent! move-2<CR>==
nmap <M-Down> :<C-u>silent! move+<CR>==
xmap <M-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xmap <M-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

if exists('g:GuiLoaded') || exists('$TMUX')
  let g:Guifont="Operator Mono:h13"
endif

if has("gui_vimr")
  colorscheme hemisu
  set background=light
end

" NEOMAKE
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_ruby_enabled_makers=['rubocop']
let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-D']
let g:neomake_place_signs=1
hi NeomakeErrorMsg ctermbg=13
hi MyWarningMsg ctermfg=1
let g:neomake_warning_sign = {'text': '!', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_error_sign = { 'text': '»', 'texthl': 'MyWarningMsg'}

"Trigger check syntax for eslint
autocmd! BufWritePost,BufEnter * Neomake

" bindings for neomake eslit errrors
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Format json files
command! FormatJSON %!python -m json.tool
command! FormatJSONV2 %!underscore print --outfmt json
" Change single quotes to double
command! DoubleQuotes %s/'\([^']*\)'/"\1"/g
" Change double quotes to single
command! SingleQuotes %s/"\([^"]*\)"/'\1'/g

" Change single quotes to double with confirmation
command! DoubleQuotesC %s/'\([^']*\)'/"\1"/gc
" Change double quotes to single with confirmation
command! SingleQuotesC %s/"\([^"]*\)"/'\1'/gc
" Remove extra line blank
command! RemoveExtraEmptyLines %!cat -s

"Insert Lines before each line
command! AddNumber  %s/^/\=printf('%-2d', line('.'))
command! ConverTabsToSpaces %s/\t/  /g

function! CleanUpReactFile()
  let save_cursor = getpos(".")
  %s/ \{2,}/ /g
  %s/{/{ /g
  %s/}/ }/g
  %s/ \{2,}/ /g
  execute "normal! \gg \<S-v> \<S-g>="
  call setpos('.', save_cursor)
endfunction

let g:table_mode_corner = '+'
command! FormatBraces :call CleanUpReactFile()

function! TogleGitHubTableMode()
  if g:table_mode_corner == '|'
    let g:table_mode_corner = '+'
  else
    let g:table_mode_corner='|'
  endif
endfunction
command! ToggleGithubTable :call TogleGitHubTableMode()

function! ConfigItalicFonts()
  if g:enable_italic_font == 1
    hi htmlArg gui=italic
    hi Comment gui=italic
    hi Type    gui=italic
    hi htmlArg cterm=italic
    hi Comment cterm=italic
    hi Type    cterm=italic ctermfg=none
  endif
endfunction

autocmd! ColorScheme * call g:ConfigItalicFonts()
autocmd! VimEnter * call g:ConfigItalicFonts()

" Strip trailing whitespace for code files on save
function! CleanUp()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

command! CleanWhiteSpaces :call CleanUp()

highlight Trail ctermbg=red guibg=red
highlight Tabs ctermbg=gray guibg=gray
call matchadd('Trail', '\s\+$', 100)
call matchadd('Tabs', '\t', 101)
" autocmd! InsertLeave,BufEnter * redraw!

if has("autocmd")
  filetype plugin indent on
end

if has('nvim')
  runtime! plugin/python_setup.vim
endif

let g:jsx_ext_required = 0 "Allow jsx in normal js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" hi SpellBad ctermbg=0

" Formats the statusline

function! Status(winnum)
  let active = a:winnum == winnr()
  let bufnum = winbufnr(a:winnum)

  let stat = ''

  " this function just outputs the content colored by the
  " supplied colorgroup number, e.g. num = 2 -> User2
  " it only colors the input if the window is the currently
  " focused one

  function! Color(active, group, content)
    if a:active
      return '%#' . a:group . '#' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  " this handles alternative statuslines
  let usealt = 0

  let type = getbufvar(bufnum, '&buftype')
  let name = bufname(bufnum)

  let altstat = ''

  if type ==# 'help'
    let altstat .= '%#SLHelp# HELP %* ' . fnamemodify(name, ':t:r')
    let usealt = 1
  elseif name ==# '__Gundo__'
    let altstat .= ' Gundo'
    let usealt = 1
  elseif name ==# '__Gundo_Preview__'
    let altstat .= ' Gundo Preview'
    let usealt = 1
  endif

  if usealt
    return altstat
  endif

  " column
  "   this might seem a bit complicated but all it amounts to is
  "   a calculation to see how much padding should be used for the
  "   column number, so that it lines up nicely with the line numbers

  "   an expression is needed because expressions are evaluated within
  "   the context of the window for which the statusline is being prepared
  "   this is crucial because the line and virtcol functions otherwise
  "   operate on the currently focused window

  function! Column()
    let vc = virtcol('.')
    let ruler_width = max([strlen(line('$')), (&numberwidth - 1)]) + &l:foldcolumn
    let column_width = strlen(vc)
    let padding = ruler_width - column_width
    let column = ''

    if padding <= 0
      let column .= vc
    else
      " + 1 because for some reason vim eats one of the spaces
      let column .= repeat(' ', padding + 1) . vc
    endif

    return column . ' '
  endfunction

  let stat .= '%#SLColumn#'
  let stat .= '%{Column()}'
  let stat .= '%*'

  if getwinvar(a:winnum, 'statusline_progress', 0)
    let stat .= Color(active, 'SLProgress', ' %p ')
  endif

  " file name
  let stat .= Color(active, 'StatusLine', active ? ' »' : ' «')
  let stat .= ' %<'
  let stat .= '%f'
  let stat .= ' ' . Color(active, 'StatusLine', active ? '«' : '»')

  " file modified
  let modified = getbufvar(bufnum, '&modified')
  let stat .= Color(active, 'User4', modified ? ' +' : '')

  " read only
  let readonly = getbufvar(bufnum, '&readonly')
  let stat .= Color(active, 'User4', readonly ? ' 🔒 ' : '')

  " paste
  if active
    if getwinvar(a:winnum, '&spell')
      let stat .= Color(active, 'SpellBad', ' S')
    endif

    if getwinvar(a:winnum, '&paste')
      let stat .= Color(active, 'Statement', ' Paste ')
    endif

  endif

  " right side
  let stat .= '%='

  " git branch
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
      :
    endif
  endif

  let stat .= '~[%{&ff} %{&fenc}]~'

  if !empty(head)
    let stat .= Color(active, 'SLBranch', ' ← ') . head . ' '
  endif

  return stat
endfunction

function! s:RefreshStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
  endfor
endfunction

command! RefreshStatus :call <SID>RefreshStatus()

augroup status
  autocmd!
  autocmd VimEnter,VimLeave,WinEnter,WinLeave,BufWinEnter,BufWinLeave * :RefreshStatus
augroup END

let $FZF_DEFAULT_COMMAND= 'ag -g ""'

let g:fzf_history_dir = '~/.local/share/fzf-history'

let vim_markdown_preview_toggle=3
" let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=0
let vim_markdown_preview_github=1

autocmd BufRead,BufNewFile *.md,*.html,*.html.haml setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
set complete+=kspell
" Enable italic fonts
let g:enable_italic_font = 1
