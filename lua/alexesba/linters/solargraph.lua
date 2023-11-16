local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('solargraph', {
  diagnostic = true,
  definitions = true,
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      })
  }
})
