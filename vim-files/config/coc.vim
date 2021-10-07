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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

