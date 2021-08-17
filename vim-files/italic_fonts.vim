function! ConfigItalicFonts()
  if g:enable_italic_font == 1
    hi Comment gui=italic
    hi Constant gui=italic
    hi PreProc gui=italic
    hi Special gui=italic
    hi Statement gui=italic
    hi Type gui=italic
    hi Keyword gui=italic
    hi GruvboxAqua gui=italic
    hi GruvboxOrange gui=italic
  endif
endfunction

augroup reload_color_schemes
  autocmd!
  autocmd ColorScheme * call g:ConfigItalicFonts()
augroup END
