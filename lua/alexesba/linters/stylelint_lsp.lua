local lspServer = require('utils.lspServer')

lspServer.configure('stylelint_lsp', {
  filetypes = { 'css', 'less', 'scss', 'sugarss', 'wxss' },
  settings = {
    stylelintplus = {
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
