let g:modeMap={
    \ 'n'      : 'Normal',
    \ 'i'      : 'Insert',
    \ 'R'      : 'Replace',
    \ 'c'      : 'Command',
    \ 'v'      : 'Visual',
    \ 'V'      : 'VisualLine',
    \ "\<C-V>" : 'VisualBlock'
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
set statusline+=%#Question#%{(g:modeMap[mode()]=='Normal')?'\ \ NORMAL\ ':''}
set statusline+=%#Directory#%{(g:modeMap[mode()]=='Insert')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(g:modeMap[mode()]=='Replace')?'\ \ RPLACE\ ':''}
set statusline+=%#Identifier#%{(g:modeMap[mode()]=='Command')?'\ \ COMMAND\ ':''}
set statusline+=%#Title#%{(g:modeMap[mode()]=='VisualBlock')?'\ \ V-BLOCK\ ':''}
set statusline+=%#Title#%{(g:modeMap[mode()]=='VisualLine')?'\ \ V-LINE\ ':''}
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
