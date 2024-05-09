local lspServer = require('basic.utils.lspServer')

lspServer.configure('solargraph', {
  diagnostic = true,
  definitions = true,
    filetypes = { 'ruby' },
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      })
  }
})
