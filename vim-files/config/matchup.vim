" highlight only the tags names for ruby
" and js

let g:matchup_matchpref = {
      \ 'eruby':  { 'tagnameonly': 1, },
      \ 'html': { 'tagnameonly': 1, },
      \}

" for jsx we need a special matcher function
let g:matchup_hotfix_javascriptreact = 'JsxHotfix'
let g:matchup_hotfix_javascript = 'JsxHotfix'
