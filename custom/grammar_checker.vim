autocmd BufRead,BufNewFile *.md,*.html,*.html.haml setlocal spell

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
set complete+=kspell
