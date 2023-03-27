local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').eslint.setup({
  capabilities = capabilities,
  on_attach = OnAttach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  }
})
