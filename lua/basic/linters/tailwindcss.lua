local lspServer = require('basic.utils.lspServer')

lspServer.configure('tailwindcss', {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = { [[\bclass:\s*'([^']*)']], [[\bclass:\s*\"([^"]*)"]] }
      }
    }
  }
})
