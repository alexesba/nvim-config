" cSpell:disable

" configure default vim netrw
"let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:fern#disable_default_mappings = 1

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> s <Plug>(fern-action-mark:toggle)
  nmap <buffer> C <Plug>(fern-action-clipboard-copy)
  nmap <buffer> P <Plug>(fern-action-clipboard-paste)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> H <Plug>(fern-action-hidden-toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
