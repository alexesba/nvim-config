"{{{1.- PLUGINS
" cSpell:disable
" Toggle TableMode: Plug 'dhruvasagar/vim-table-mode' {{{
noremap <silent><Leader>to :TableModeToggle<CR>
noremap <silent><Leader>tr :TableModeRealign<CR>
noremap <silent><Leader>tg :TableModeToggleGithubTable<CR>
"}}}

" Undotree: {{{
noremap <silent><leader>un :UndotreeToggle<CR>
"}}}

" 2.- CUSTOM MAPPINGS: {{{

" Format all the file from the first line to the end
noremap <silent><leader>fef :normal! gg=G``<CR>
nnoremap <silent><Esc> :noh<CR>

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
nnoremap <A-k> :<C-u>silent! move-2<CR>==
nnoremap <A-j> :<C-u>silent! move+<CR>==
xnoremap <A-k> :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <A-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

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

" Disable Arrow keys in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
"}}}

nnoremap <leader>cf :CopyFilePath<CR>:echo "File path copied!"<CR>

" Copy from cursor to the end of the line
nnoremap Y y$

nnoremap n nzzzv
noremap N Nzzzv
noremap J mzJ`z

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap - -<C-g>u
inoremap _ _<C-g>u
inoremap : :<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Jumplist Mutations:
noremap <expr> k (v:count > 5 ? "m'". v:count : ""). 'k'
noremap <expr> j (v:count > 5 ? "m'". v:count : ""). 'j'

" auto complete menu
nnoremap <silent><leader>ac :CodeActionMenu<CR>
"}}}

