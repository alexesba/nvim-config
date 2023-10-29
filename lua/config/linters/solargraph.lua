require'lspconfig'.solargraph.setup{
  diagnostic = true,
  definitions  = true,
  on_attach = OnAttach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  }
}
