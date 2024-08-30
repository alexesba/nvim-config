local lspServer = require('utils.lspServer')

lspServer.configure('typos_lsp', {
  filetypes = {
    'markdown',
    'text',
    'ruby',
    'eruby',
    'javascript',
    'javascriptreact'
  }
})
