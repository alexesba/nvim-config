local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').stylelint_lsp.setup({
  filetypes = { 'css', 'less', 'scss', 'sugarss', 'wxss' },
  on_attach = OnAttach,
  capabilities = capabilities,
  settings = {
    stylelintplus  = {
      autoFixOnFormat = true
    }
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  },
})
