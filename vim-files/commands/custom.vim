" Format json files
command! FormatJSON %!python -m json.tool
command! FormatJSONV2 %!underscore print --outfmt json
command! FormatCss :call FormatCss()
" Change single quotes to double
command! DoubleQuotes %s/'\([^']*\)'/"\1"/g
" Change double quotes to single
command! SingleQuotes %s/"\([^"]*\)"/'\1'/g
" Change single quotes to double with confirmation
command! DoubleQuotesC %s/'\([^']*\)'/"\1"/gc
" Change double quotes to single with confirmation
command! SingleQuotesC %s/"\([^"]*\)"/'\1'/gc
" Remove extra line blank
" command! RemoveExtraEmptyLines %!cat -s
command! RemoveExtraEmptyLines :call RemoveExtraEmptyLinesFn()
"Insert Lines before each line
command! AddNumber  %s/^/\=printf('%-2d', line('.'))
command! ConverTabsToSpaces %s/\t/  /g

" located at ~/.config/nvim/custom/functions.vim
command! UpdateRubyHashesByLines :call FormatHashes()
command! UpdateHashSyntax :call UpdateRubyHashes()
command! FormatBraces :call CleanUpReactFile()
command! TableModeToggleGithubTable :call TogleGitHubTableMode()
command! CleanWhiteSpaces :call CleanUp()
command! UnscapeDoubleQuotes %s/\\"//g
command! RemoveLineBreak %s/\\n//g
command! RemoveEmptyLines :g/^$/d
command! FormatXML :call FormatXMLFn()
command! FormatSQL :%!sqlformat --reindent --keywords upper --identifiers lower -
command! FormatSQL2 :%!sql-formatter-cli
command! CopyFullPath let @+= expand("%:p")
command! CopyRelativePath let @+= expand("%")
command! ShowHiName :exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')