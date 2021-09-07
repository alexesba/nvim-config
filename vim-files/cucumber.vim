function ConfigCucumberSyntax() abort
  syntax region cucumberGivenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberGivenRegion,cucumberGivenAndRegion,cucumberGivenButRegion
  syntax region cucumberWhenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberWhenRegion,cucumberWhenAndRegion,cucumberWhenButRegion
  syntax region cucumberThenString start=/"/ skip=/\\"/ end=/"/ contained containedin=cucumberThenRegion,cucumberThenAndRegion,cucumberThenButRegion
  highlight default link cucumberGivenString cucumberString
  highlight default link cucumberWhenString cucumberString
  highlight default link cucumberThenString cucumberString
endfunction

augroup cucumber_syntax
  autocmd!
  autocmd ColorScheme * call g:ConfigCucumberSyntax()
  autocmd VimEnter * call g:ConfigItalicFonts()
augroup END
