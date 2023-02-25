require("grammar-guard").init()

require("lspconfig").grammar_guard.setup({
  cmd= { '/Users/alexesba/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin/ltex-ls' },
  settings={
  ltext={
    enabled={"markdown", "javascriptreact", "ruby", "javascript"},
    sentenceCacheSize = 200,
    additionalRules = {
      enablePickyRules  = true,
      motherTongue = 'en'
    },
    dictionary = {},
    disabledRules = {},
    hiddenFalsePositives = {}
  }
}
})
