local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('eslint', {
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      })
  }
})
