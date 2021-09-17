if exists('+colorcolumn')
  if version > 730
    let &colorcolumn=join(range(81,999),",")
  else
    let &colorcolumn=80
  endif
endif



augroup columnLimit
  autocmd!
  autocmd BufRead,BufEnter * highlight ColumnLimit ctermbg=Red guibg=Red

  let columnLimit = 81
  let pattern = '\%<' . (columnLimit+1) . 'v.\%>' . columnLimit . 'v'

  autocmd BufRead,BufEnter * let w:m1=matchadd('ColumnLimit', pattern, -1)
augroup END
