" Function to source only if file exists 
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" Detect Os and set the global buffer os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

function! CleanUpReactFile()
  let save_cursor = getpos(".")
  %s/ \{2,}/ /g
  %s/{/{ /g
  %s/}/ }/g
  %s/ \{2,}/ /g
  execute "normal! \gg \<S-v> \<S-g>="
  call setpos('.', save_cursor)
endfunction

function! FormatHashes()
  :silent! %s/:\([^ ]*\)\(\s*\)=>/\1: /g
  :silent! %s/}, {/},\r {/g
  :silent! %s/"\([^"]*\)"/'\1'/g
  " call setpos('.', save_cursor)
  execute "normal! \gg \<Sv> \<S-g>="
endfunction

" Converts old ruby hashes to the new syntax.
function! UpdateRubyHashes()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
endfunction

" Strip trailing whitespace for code files on save
function! CleanUp()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction


function! TogleGitHubTableMode()
  if g:table_mode_corner == '|'
    let g:table_mode_corner = '+'
  else
    let g:table_mode_corner='|'
  endif
endfunction

function! ReloadConfigFile()
  :source $MYVIMRC
endfunction
command! Reload silent!call ReloadConfigFile()
function! EditConfigurationFile()
  :e $MYVIMRC
endfunction
command! OpenConfig silent!call EditConfigurationFile()




set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)