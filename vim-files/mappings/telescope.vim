" Telescope: {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>ff :lua require('telescope.builtin').find_files({file_ignore_patterns = {'node_modules/*', '.git/**'} })<CR>
nnoremap <expr><leader>fk ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>fm <cmd>Telescope keymaps<cr>
"}}}
