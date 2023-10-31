local lspServer = require('utils.lspServer')

lspServer.configure('elixirls', {
  cmd = { "elixir-ls" },
})
