" Linter config for EslintFix cmd
let g:css_csslint_exe = nrun#Which('css_lint')
let g:eslint_exe = nrun#Which('eslint')
let g:python_pylama_exe = nrun#Which('pylama')
let g:ruby_rubocop_exe=nrun#Which('rubocop')
let g:scss_scsslint_exe = nrun#Which('scss-lint')
let g:stylelint_css_exe = nrun#Which('stylelint')

function! BuildCmd(path, args)
  return a:path ." ". expand("%:p") ." ". a:args
endfunction

function! GetExecutablePath()
 if &filetype == "css"
   if executable(g:stylelint_css_exe)
     return BuildCmd(g:stylelint_css_exe, "--fix")
   endif
   if executable(g:css_csslint_exe)
     return BuildCmd(g:css_csslint_exe, "--fix")
   endif
 endif

 if &filetype == "scss"
   if executable(g:stylelint_css_exe)
     return BuildCmd(g:stylelint_css_exe, "--fix")
   endif
   if executable(g:scss_scsslint_exe)
     return BuildCmd(g:scss_scsslint_exe, "--fix")
   endif
 endif

 if &filetype == "javascript"
   if executable(g:eslint_exe)
     return BuildCmd(g:eslint_exe, "--fix")
   endif
 endif

 if &filetype == "ruby"
   if executable(g:ruby_rubocop_exe)
     return BuildCmd(g:ruby_rubocop_exe, "-A")
   endif
 endif
endfunction

function! EslitFixFn()
  let eslintfixcmd = GetExecutablePath()
  if eslintfixcmd != ''
    let save_cursor = getpos(".")
    execute "! ". eslintfixcmd
    :silent! Neomake
    :call setpos('.', save_cursor)
  else
    echoerr string(eslintfixcmd)
  endif
endfunction

command! EslintFix silent! call EslitFixFn()
