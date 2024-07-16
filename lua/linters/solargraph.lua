local lspServer = require('utils.lspServer')

lspServer.configure('solargraph', {
  diagnostic = true,
  definitions = true,

  cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", 'stdio' },

  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      })
  }
})
