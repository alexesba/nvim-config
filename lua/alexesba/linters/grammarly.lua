local lspServer = require('utils.lspServer')

lspServer.configure('grammarly', {
  filetypes = { "markdown", "text", "md" },
  init_options = {
    clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
  },
})
