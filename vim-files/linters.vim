" NEOMAKE
let g:eslint_exe = nrun#Which('eslint')
let g:scss_scsslint_exe = nrun#Which('scss-lint')
let g:css_csslint_exe = nrun#Which('css_lint')
let g:python_pylama_exe = nrun#Which('pylama')
let g:ruby_rubocop_exe=nrun#Which('rubocop')
let g:neomake_place_signs=1
hi NeomakeErrorMsg ctermbg=13
hi MyWarningMsg ctermfg=1
let g:neomake_warning_sign = {'text': '!', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_error_sign = { 'text': '»', 'texthl': 'MyWarningMsg'}

let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }


if g:ruby_rubocop_exe != "rubocop not found"
        let g:neomake_ruby_rubocop_exe= g:ruby_rubocop_exe
        let g:neomake_ruby_enabled_makers=['rubocop']
        let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-D']
        autocmd! BufWritePost,BufEnter *.rb,*.rake Neomake
endif

"Trigger check syntax for js files
if g:eslint_exe != "eslint not found"
        let g:neomake_javascript_eslint_exe = g:eslint_exe
        let g:neomake_javascript_enabled_makers=['eslint']
  autocmd! BufWritePost,BufEnter *.js,*.jsx Neomake
endif

"Trigger check syntax for py files
if g:python_pylama_exe != "pylama not found"

        let g:neomake_python_pylama_exe = g:python_pylama_exe
        let g:neomake_python_enabled_makers=['pylama']
        autocmd! BufWritePost,BufEnter *.py Neomake
endif

"Trigger check syntax for scss files
if g:scss_scsslint_exe != "scss-lint not found"
        let g:neomake_scss_scsslint_exe = g:scss_scsslint_exe
        let g:neomake_scss_enabled_makers = ['scsslint']
        autocmd! BufWritePost,BufEnter *.scss Neomake
endif

"Trigger check syntax for css files
if g:css_csslint_exe != "css_lint not found"
        let g:neomake_css_csslint_exe = g:css_csslint_exe
        let g:neomake_css_enabled_makers = ['csslint']
        autocmd! BufWritePost,BufEnter *.css Neomake
endif


function! EslitFixFn()
  if g:neomake_javascript_eslint_exe != "eslint not found"
    let eslintfixcmd = g:neomake_javascript_eslint_exe ." ". expand("%:p") ." --fix"
    execute "! ". eslintfixcmd
    :silent! Neomake
  else
    echoerr string(g:neomake_javascript_eslint_exe)
  endif
endfunction

function! RubocopFixFn()
  execute "! rubocop % -a"
  :silent! Neomake
endfunction

command! EslintFix silent!call EslitFixFn()
command! RubocopFix silent!call RubocopFixFn()
