local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').cucumber_language_server.setup({
  on_attach = OnAttach,
  capabilities = capabilities
})
