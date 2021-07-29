function! ConfigItalicFonts()
  if g:enable_italic_font == 1
    hi htmlArg gui=italic
    hi Comment gui=italic
    hi Type    gui=italic
    hi keyword gui=italic
    hi htmlArg cterm=italic
    hi Comment cterm=italic
    hi Type    cterm=italic ctermfg=none
  endif

  if exists("*neomake#virtualtext#DefineHighlights")
  :call neomake#virtualtext#DefineHighlights()
 endif
endfunction

augroup reload_color_schemes
        autocmd!
        autocmd ColorScheme * call g:ConfigItalicFonts()
        autocmd VimEnter * call g:ConfigItalicFonts()
augroup END
