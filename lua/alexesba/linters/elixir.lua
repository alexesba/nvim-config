local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('elixirls', {
  cmd = { "elixir-ls" },
})
