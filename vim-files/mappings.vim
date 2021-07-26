" Set the leader key
let mapleader=","
map <silent><C-p> :NERDTreeToggle<CR>
"Using FZF as file search
map <silent><C-f> :FZF<CR>
nmap <silent><Leader>f :FZF<CR>

map <silent><Space> :noh<CR>
" Toggle TableMode
map <silent><Leader>to :TableModeToggle<CR>
map <silent><Leader>tr :TableModeRealign<CR>

" Format all the file from the first line to the end
nmap <silent><leader>fef :normal! gg=G``<CR>

"Toogle comments
nmap <silent> <Leader>c :TComment<CR>
vmap <silent> <Leader>c :TComment<CR>
imap <silent> <Leader>c <Esc>:TComment<CR>i

" Command to move among tabs in Konsole-style
map <silent><leader>1 :tabn 1 <cr>
map <silent><leader>2 :tabn 2 <cr>
map <silent><leader>3 :tabn 3 <cr>
map <silent><leader>4 :tabn 4<cr>
map <silent><leader>5 :tabn 5<cr>
map <silent><leader>6 :tabn 6<cr>
map <silent><leader>7 :tabn 7<cr>
map <silent><leader>8 :tabn 8<cr>
map <silent><leader>9 :tabn 9<cr>
map <silent><leader>0 :tabn 0<cr>

" bindings for neomake eslit errrors: ~/.config/nvim/custom/linters.vim
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

nmap <silent>rt :TableModeRealign <CR>

" Mapping to move single line in normal mode and move blocks in visual mode
"
if g:os == "Darwin"
    nmap <M-Up>   :<C-u>silent! move-2<CR>==
    nmap <M-Down> :<C-u>silent! move+<CR>==
    xmap <M-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
    xmap <M-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
else
    " nmap <S-Up>   :<C-u>silent! move-2<CR>==
    " nmap <S-Down> :<C-u>silent! move+<CR>==
    " xmap <S-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
    " xmap <S-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
    nmap <A-k>   :<C-u>silent! move-2<CR>==
    nmap <A-j> :<C-u>silent! move+<CR>==
    xmap <A-k>   :<C-u>silent! '<,'>move-2<CR>gv=gv
    xmap <A-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv
end

nmap <silent> <Leader>no :Reprobado<CR>
nmap <silent> <Leader>na :Reprobada<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap Q <Nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Configuring Ctrl-l to navigate between buffers
nnoremap <C-l> :Buffers<CR>


"Configure Ag in vim to search the word under the cursor and search the
"selected text
nmap  <silent> <A-f> :Ag <C-R><C-W><CR>
vnoremap <silent><A-f> y:Ag <C-R>=fnameescape(@")<CR><CR>

