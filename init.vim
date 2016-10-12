call plug#begin('~/.vim/plugged')
" Colorschemes 
Plug 'alexesba/colors'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'Addisonbean/Vim-Xcode-Theme'

" utils
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'moll/vim-node'
Plug 'benjie/neomake-local-eslint.vim'
" Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
"Delete files using commands
Plug 'tpope/vim-eunuch'
Plug 'ashisha/image.vim'
" Plug 'mhinz/vim-signify'
Plug 'gcmt/taboo.vim'

"Enhancements
" Plug 'bling/vim-airline'
" Plug 'geekjuice/vim-picoline'


"Languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'avakhov/vim-yaml'
Plug 'chase/vim-ansible-yaml'
Plug 'digitaltoad/vim-jade'
Plug 'vim-scripts/xml.vim'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
" Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }
Plug 'gko/vim-coloresque'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'leafgarland/typescript-vim'


call plug#end()

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction
syntax on
filetype on
filetype plugin on
filetype indent on
set nowrap
set hlsearch
set incsearch
set number
set expandtab
let mapleader=","
map <leader>n :NERDTreeToggle <cr>

if exists('+colorcolumn')
  set colorcolumn=80
endif

map <Space> :noh<cr>
set ar " autoload edited file
nnoremap <leader>fef :normal! gg=G``<CR>

"Toogle comments
nnoremap <silent> <Leader>c :TComment<CR>
vnoremap <silent> <Leader>c :TComment<CR>
inoremap <silent> <Leader>c <Esc>:TComment<CR>i

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

colorscheme hemisu
set background=light
" set guifont=Monaco:h12
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has("gui_vimr")
  colorscheme hemisu
  set background=light
end

" Ctrlp
let g:ctrlp_dont_split = "NERD_tree_2"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = "<leader>f"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_depth = 40
let g:ctrlp_extensions = ['tag']
let g:ctrlp_max_files=10000
let g:cssColorVimDoNotMessMyUpdatetime = 1

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let s:ctrlp_fallback = 'ag %s
      \ --nocolor --nogroup --depth 5
      \ --hidden --follow --smart-case
      \ --ignore .bazaar
      \ --ignore .bzr
      \ --ignore .git
      \ --ignore .hg
      \ --ignore .svn
      \ --ignore .ccache
      \ --ignore .DS_Store
      \ --ignore .opt1
      \ --ignore .pylint.d
      \ --ignore .shell
      \ --ignore .wine
      \ --ignore .wine-pipelight
      \ --ignore "**/*.pyc"
      \ --ignore "**/*.class"
      \ --ignore "**/*.o"
      \ -g ""'

let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
\ }



nnoremap <leader>. :CtrlPTag<cr>
" let g:syntastic_javascript_eslint_exec=system('$(which eslint)')
" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
let g:neomake_javascript_enabled_makers=['eslint', 'rubylint']

"Trigger check syntax for eslint 
autocmd! BufWritePost,BufEnter * Neomake


" Format json files
command! FormatJSON %!python -m json.tool

" autocmd BufReadPost * :DetectIndent
" Remove whitespaces
" Strip trailing whitespace for code files on save
function! CleanUp()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

command! CleanWhiteSpaces :call CleanUp()

highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

if has("autocmd")
  filetype plugin indent on
end

if has('nvim')
  runtime! plugin/python_setup.vim
endif


autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2

let g:jsx_ext_required = 0 "Allow jsx in normal js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" hi SLLineNr ctermbg=0 

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
  let stat .= Color(active, 'SLArrows', active ? ' »' : ' «')
  let stat .= ' %<'
  let stat .= '%f'
  let stat .= ' ' . Color(active, 'SLArrows', active ? '«' : '»')

  " file modified
  let modified = getbufvar(bufnum, '&modified')
  let stat .= Color(active, 'User4', modified ? ' +' : '')

  " read only
  let readonly = getbufvar(bufnum, '&readonly')
  let stat .= Color(active, 'User4', readonly ? ' 🔒 ' : '')

  " paste
  if active
    if getwinvar(a:winnum, '&spell')
      let stat .= Color(active, 'SLLineNr', ' S')
    endif

    if getwinvar(a:winnum, '&paste')
      let stat .= Color(active, 'SLLineNr', ' P')
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
    endif
  endif

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
