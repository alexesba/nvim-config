local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').tailwindcss.setup({
  capabilities = capabilities,
  on_attach = OnAttach
})
