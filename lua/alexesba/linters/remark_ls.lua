local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').remark_ls.setup({
  on_attach = OnAttach,
  capabilities = capabilities
})
