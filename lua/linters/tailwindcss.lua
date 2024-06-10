local lspServer = require('utils.lspServer')
local on_attach = require('utils.on_attach')

lspServer.configure('tailwindcss', {
  on_attach = function(_, bufnr)
    require("tailwindcss-colors").buf_attach(bufnr)
    on_attach(_, bufnr)
  end,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = { [[\bclass:\s*'([^']*)']], [[\bclass:\s*\"([^"]*)"]] }
      }
    }
  }
})
