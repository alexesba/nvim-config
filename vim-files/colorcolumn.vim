if exists('+colorcolumn')
  if version > 730
    let &colorcolumn=join(range(81,999),",")
    " let &colorcolumn="80,".join(range(120,999),",")
    match ErrorMsg '\%>80v.\+'
  else
    let &colorcolumn=80
  endif
endif


