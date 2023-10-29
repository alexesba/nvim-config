local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').grammarly.setup({
  on_attach = OnAttach,
  capabilities = capabilities
})
