let g:modeMap={
    \ 'n'      : 'N',
    \ 'no'     : 'N·Operator Pending',
    \ 'v'      : 'V',
    \ 'V'      : 'VLine',
    \ "\<C-V>" : 'VBlock',
    \ 's'      : 'Select',
    \ 'S'      : 'SLine',
    \ "\<C-S>" : 'SBlock',
    \ 'i'      : 'I',
    \ 'R'      : 'R',
    \ 'Rv'     : 'VReplace',
    \ 'c'      : 'Command',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Terminal'
    \}
" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

set statusline=
set statusline+=%#Question#%{(g:modeMap[mode()]=='N')?'\ \ NORMAL\ ':''}
set statusline+=%#Directory#%{(g:modeMap[mode()]=='I')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(g:modeMap[mode()]=='R')?'\ \ RPLACE\ ':''}
set statusline+=%#Identifier#%{(g:modeMap[mode()]=='Command')?'\ \ COMMAND\ ':''}
set statusline+=%#Title#%{(g:modeMap[mode()]=='VBlock')?'\ \ V-BLOCK\ ':''}
set statusline+=%#Title#%{(g:modeMap[mode()]=='VLine')?'\ \ V-LINE\ ':''}
set statusline+=%#MatchParen#%{&paste?'\ PASTE\ ':''}
set statusline+=\%#Cursor#\ %n\            " buffer number
" set statusline+=%\       " colour
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorLineNr# " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#\ %t\                   " short file name

set statusline+=%=                          " right align
set statusline+=%#CursorLine#\ %Y\   " colour File type
set statusline+=%#CursorIM#\ %3l:%-2c\     " colour line + column
set statusline+=%#Type#\ %{FileSize()}\         "colour File Zize
set statusline+=%#Cursor#\ %3p%%\                " percentage


function! F()
    normal! gv
    throw mode()
endfunction
vnoremap <F9> <ESC>:call F()<CR>
