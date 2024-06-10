local lspServer = require('utils.lspServer')
lspServer.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        flake8 = {
          enabled = true,
          maxLineLength = 119,
        },
        mypy = {
          enabled = true,
        },
        pycodestyle = {
          enabled = true,
        },
        pyflakes = {
          enabled = true,
        },
        rope_autoimport = {
          completions  = {
            enabled = true
          }
        }
      }
    }
  }
})
