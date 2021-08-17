autocmd! FileType javascriptreact
      \ call tcomment#type#Define('javascriptreact', {'commentstring_rx': '\%%(// %s\|{/* %s */}\)', 'commentstring': '{/* %s */}'})
      \ call tcomment#type#Define('javascriptreact_block', '{/* %s */}')
      \ call tcomment#type#Define('javascriptreact_inline', '{/* %s */}')

autocmd! FileType jbuilder
       \ call tcomment#type#Define('jbuilder', '; %s')
