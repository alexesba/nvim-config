" NEOMAKE
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_scss_scsslint_exe = nrun#Which('scss-lint')
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_css_csslint_exe = nrun#Which('css_lint')
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_ruby_enabled_makers=['rubocop']
let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-D']
let g:neomake_place_signs=1
hi NeomakeErrorMsg ctermbg=13
hi MyWarningMsg ctermfg=1
let g:neomake_warning_sign = {'text': '!', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_error_sign = { 'text': '»', 'texthl': 'MyWarningMsg'}

let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }

"Trigger check syntax for js files
if g:neomake_javascript_eslint_exe != "eslint not found"
  autocmd! BufWritePost,BufEnter *.js,*.jsx Neomake
endif

"Trigger check syntax for scss files
if g:neomake_scss_scsslint_exe != "scss-lint not found"
  autocmd! BufWritePost,BufEnter *.scss Neomake
endif

"Trigger check syntax for css files
if g:neomake_css_csslint_exe != "css_lint not found"
  autocmd! BufWritePost,BufEnter *.css Neomake
endif

function! EslitFixFn()
  if g:neomake_javascript_eslint_exe != "eslint not found"
    let eslintfixcmd = g:neomake_javascript_eslint_exe ." ". expand("%:p") ." --fix"
    execute "! ". eslintfixcmd
  else
    echo g:neomake_javascript_eslint_exe
  endif
endfunction

command! EslintFix :silent!call EslitFixFn()
command! RubocopFix silent! %!rubocop % -a
