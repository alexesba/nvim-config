" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <A-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <A-n> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <A-p> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent><space>f <cmd> lua vim.lsp.buf.formatting()<CR>


autocmd CursorHold * lua vim.diagnostic.open_float(0, { 
      \ scope = 'line', 
      \ focusable = false
      \ })
