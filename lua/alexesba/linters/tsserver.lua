local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('tsserver', {
  preferences = {
    quotePreference = 'auto'
  },
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      })
  }
})
