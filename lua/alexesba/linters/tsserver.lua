require'lspconfig'.tsserver.setup{
  on_attach = OnAttach,
  preferences = {
    quotePreference ="auto"
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  }
}
