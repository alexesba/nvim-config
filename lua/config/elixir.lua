-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local capabilities = vim.lsp.protocol.make_client_capabilities()

require('lspconfig').elixirls.setup {
  cmd = { "elixir-ls" },
  capabilities = capabilities,
  on_attach = OnAttach,
}
