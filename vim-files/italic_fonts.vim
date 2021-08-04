function! ConfigItalicFonts()
  if g:enable_italic_font == 1
    hi htmlArg gui=italic
    " hi Type  gui=italic
    hi keyword gui=italic
    hi Keyword gui=italic
    hi Comment gui=italic
    hi Todo gui=italic
    hi Error gui=italic
    hi rubyPseudoVariable gui=italic
    hi jsClassKeyword gui=italic
    hi Special gui=italic
    hi Folded gui=italic
    hi SpellCap gui=italic
    hi htmlBoldUnderlineItalic gui=italic
    hi htmlBoldItalic gui=italic
    hi htmlUnderlineItalic gui=italic
    hi htmlItalic gui=italic
    hi markdownItalic gui=italic
    hi GruvboxAqua gui=italic

    hi Identifier gui=italic
    hi Label gui=italic
    hi Special gui=italic
    hi Exception gui=italic
    hi jsClassKeyword gui=italic
    hi jsFunction gui=italic
    hi jsUndefined gui=italic
    hi jsExtendsKeyword gui=italic
    hi jsExportDefault gui=italic
    hi rubyMacro gui=italic
  endif
endfunction

augroup reload_color_schemes
  autocmd!
  autocmd ColorScheme * call g:ConfigItalicFonts()
augroup END
