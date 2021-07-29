if exists('+colorcolumn')
  if version > 730
    let &colorcolumn=join(range(81,999),",")
  else
    let &colorcolumn=80
  endif
endif



augroup collumnLimit
  autocmd!
  autocmd BufRead,BufEnter * highlight CollumnLimit ctermbg=Red guibg=Red

  let collumnLimit = 81
  let pattern = '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'

  autocmd BufRead,BufEnter * let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END
