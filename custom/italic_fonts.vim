function! ConfigItalicFonts()
  if g:enable_italic_font == 1
    hi htmlArg gui=italic
    hi Comment gui=italic
    hi Type    gui=italic
    hi htmlArg cterm=italic
    hi Comment cterm=italic
    hi Type    cterm=italic ctermfg=none
  endif
endfunction

autocmd! ColorScheme * call g:ConfigItalicFonts()
autocmd! VimEnter * call g:ConfigItalicFonts()
"
"
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
