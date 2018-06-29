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
