--[[ local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('grammar_guard',{
  cmd = { '/Users/alexesba/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin/ltex-ls' },
  settings = {
    ltext = {
      enabled = { "markdown", "javascriptreact", "ruby", "javascript" },
      sentenceCacheSize = 200,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'en'
      },
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {}
    }
  }
}) ]]
