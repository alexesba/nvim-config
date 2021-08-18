autocmd! BufWritePost * GitGutter
" Highlight the symbol and its references when holding the cursor.
autocmd! CursorHold * silent call CocActionAsync('highlight')
