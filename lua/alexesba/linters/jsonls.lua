local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  on_attach = OnAttach
})
