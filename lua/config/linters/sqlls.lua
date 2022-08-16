local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.sqlls.setup{
  capabilities = capabilities,
  on_attach = OnAttach,
}
