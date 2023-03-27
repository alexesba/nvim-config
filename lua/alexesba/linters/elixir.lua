local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').elixirls.setup({
  cmd = { "elixir-ls" },
  capabilities = capabilities,
  on_attach = OnAttach,
})
