" Set the leader key
let mapleader=","
map <silent><leader>n :NERDTreeToggle <cr>
map <silent><Space> :noh<cr>

" check one time after 4s of inactivity in normal mode
nmap <leader>fef :normal! gg=G``<CR>

"Toogle comments
nmap <silent> <Leader>c :TComment<CR>
vmap <silent> <Leader>c :TComment<CR>
imap <silent> <Leader>c <Esc>:TComment<CR>i

"Using FZF as file search
nmap <silent> <Leader>f :FZF<CR>

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


" Mapping to move single line in normal mode and move blocks in visual mode
"
if g:os == "Darwin"
        nmap <M-Up>   :<C-u>silent! move-2<CR>==
        nmap <M-Down> :<C-u>silent! move+<CR>==
        xmap <M-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
        xmap <M-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
else
        nmap <S-Up>   :<C-u>silent! move-2<CR>==
        nmap <S-Down> :<C-u>silent! move+<CR>==
        xmap <S-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
        xmap <S-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
end