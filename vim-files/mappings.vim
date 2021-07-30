" Set The Leader Key:
let mapleader=","

"{{{1.- PLUGINS

" NERDTreeToggle: Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
noremap <silent><C-p> :NERDTreeToggle<CR>

" Using FZF As File Search: Plug 'junegunn/fzf.vim'
noremap <silent><C-f> :FZF<CR>
noremap <silent><Leader>f :FZF<CR>
" Configuring Ctrl-l to navigate between buffers
nnoremap <C-l> :Buffers<CR>

"Configure Ag in vim to search the word under the cursor and search the
"selected text
noremap  <silent> <A-f> :Ag <C-R><C-W><CR>
vnoremap <silent><A-f> y:Ag <C-R>=fnameescape(@")<CR><CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Mapping selecting mappings
noremap <leader><tab> <plug>(fzf-maps-n)
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

" Toggle TableMode: Plug 'dhruvasagar/vim-table-mode'
noremap <silent><Leader>to :TableModeToggle<CR>
noremap <silent><Leader>tr :TableModeRealign<CR>
noremap <silent>rt :TableModeRealign <CR>

"Toogle Comments: Plug 'tomtom/tcomment_vim'

noremap <silent> <Leader>c :TComment<CR>
vnoremap <silent> <Leader>c :TComment<CR>
inoremap <silent> <Leader>c <Esc>:TComment<CR>i

" Undotree
noremap <silent><leader>un :UndotreeToggle<CR>

"}}}

"{{{2.- CUSTOM MAPPINGS

" Format all the file from the first line to the end
noremap <silent><leader>fef :normal! gg=G``<CR>
noremap <silent><Space> :noh<CR>

" Command to move among tabs in Konsole-style
noremap <silent><leader>1 :tabn 1 <cr>
noremap <silent><leader>2 :tabn 2 <cr>
noremap <silent><leader>3 :tabn 3 <cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 0<cr>

" Mapping to move single line in normal mode and move blocks in visual mode
if g:os == "Darwin"
    noremap <A-j>:<C-u>silent! move+<CR>==
    noremap <A-k>:<C-u>silent! move-2<CR>==
    xnoremap <A-j>:<C-u>silent! '<,'>move'>+<CR>gv=gv
    xnoremap <A-k>:<C-u>silent! '<,'>move-2<CR>gv=gv
else
    noremap <A-k>   :<C-u>silent! move-2<CR>==
    noremap <A-j> :<C-u>silent! move+<CR>==
    xnoremap <A-k>   :<C-u>silent! '<,'>move-2<CR>gv=gv
    xnoremap <A-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv
end

noremap <silent> <Leader>no :Reprobado<CR>
noremap <silent> <Leader>na :Reprobada<CR>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap Q <Nop>

" Disable Arrow keys in Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

noremap <Leader><Space>, :ll<CR>         " go to current error/warning
noremap <Leader><Space>c :lclose<CR>     " close location window
noremap <Leader><Space>n :lnext<CR>      " next error/warning
noremap <Leader><Space>o :lopen<CR>      " open location window
noremap <Leader><Space>p :lprev<CR>      " previous error/warning

nnoremap <leader>c :CopyFilePath<CR>

nnoremap n nzzzv
noremap N Nzzzv
noremap J mzJ`z

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Jumplist Mutations:
noremap <expr> k (v:count > 5 ? "m'". v:count : ""). 'k'
noremap <expr> j (v:count > 5 ? "m'". v:count : ""). 'j'
"}}}

