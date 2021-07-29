" NEOMAKE
let g:css_csslint_exe = nrun#Which('css_lint')
let g:eslint_exe = nrun#Which('eslint')
let g:python_pylama_exe = nrun#Which('pylama')
let g:ruby_rubocop_exe=nrun#Which('rubocop')
let g:scss_scsslint_exe = nrun#Which('scss-lint')
let g:stylelint_css_exe = nrun#Which('stylelint')

function! ApplyScssStyleLintinter()
  "Trigger check synktax for scss files
  if executable(g:stylelint_css_exe) && !exists('g:neomake_scss_enabled_makers')
    let g:neomake_scss_stylelint_exe = g:stylelint_css_exe
    let g:neomake_scss_enabled_makers = ['stylelint']
    autocmd! BufWritePost,BufEnter *.scss Neomake
  endif
endfunction

function! ApplyCssStyleLintinter()
  "Trigger check synktax for scss files
  if executable(g:stylelint_css_exe)
    let g:neomake_css_stylelint_exe = g:stylelint_css_exe
    let g:neomake_css_enabled_makers = ['stylelint']

    autocmd! BufWritePost,BufEnter *.css Neomake
  endif
endfunction

function! ApplyRubocopLinter()
  if executable(g:ruby_rubocop_exe)
    let g:neomake_ruby_rubocop_exe= g:ruby_rubocop_exe
    let g:neomake_ruby_enabled_makers=['rubocop']
    let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-D']
    autocmd! BufWritePost,BufEnter *.rb,*.rake Neomake
  endif
endfunction

function! ApplyJavascriptLinter()
  "Trigger check syntax for js files
  if executable(g:eslint_exe)
    let g:neomake_javascript_eslint_exe = g:eslint_exe
    let g:neomake_javascript_enabled_makers=['eslint']
    autocmd! BufWritePost,BufEnter *.js,*.jsx Neomake
  endif
endfunction

function! ApplyPythonLinter()
  "Trigger check syntax for py files
  if executable(g:python_pylama_exe)
    let g:neomake_python_pylama_exe = g:python_pylama_exe
    let g:neomake_python_enabled_makers=['pylama']
    autocmd! BufWritePost,BufEnter *.py Neomake
  endif
endfunction

function! ApplyScssLinter()
  "Trigger check syntax for scss files
  if executable(g:scss_scsslint_exe) && !exists('g:neomake_scss_enabled_makers')
    let g:neomake_scss_scsslint_exe = g:scss_scsslint_exe
    let g:neomake_scss_enabled_makers = ['scsslint']
    autocmd! BufWritePost,BufEnter *.scss Neomake
  endif
endfunction

"Trigger check syntax for css files
function! ApplyCssLinter()
  if executable(g:css_csslint_exe)
    let g:neomake_css_csslint_exe = g:css_csslint_exe
    let g:neomake_css_enabled_makers = ['csslint']
    autocmd! BufWritePost,BufEnter *.css Neomake
  endif
endfunction

augroup linters
  autocmd!

  autocmd FileType css call ApplyCssStyleLintinter()
  autocmd FileType scss call ApplyScssStyleLintinter()

  autocmd FileType css call ApplyCssLinter()
  autocmd FileType scss call ApplyScssLinter()

  autocmd FileType javascript call ApplyJavascriptLinter()
  autocmd FileType ruby call ApplyRubocopLinter()
augroup END

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
     return BuildCmd(g:ruby_rubocop_exe, "-a")
   endif
 endif
endfunction

function! EslitFixFn()
  let eslintfixcmd = GetExecutablePath()
  if eslintfixcmd != ''
    execute "! ". eslintfixcmd
    :silent! Neomake
  else
    echoerr string(eslintfixcmd)
  endif
endfunction

command! EslintFix silent! call EslitFixFn()
