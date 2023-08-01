local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').grammarly.setup({
  on_attach = OnAttach,
  capabilities = capabilities,
  filetypes = { "markdown", "text", "md" },
  init_options = {
    clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
  },
})
