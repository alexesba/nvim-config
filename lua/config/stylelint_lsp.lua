local util = require 'lspconfig.util'

require'lspconfig'.stylelint_lsp.setup {
  filetypes = { "sass", "scss", "css" },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  },
  root_dir =  util.root_pattern('.stylelintrc.json', 'package.json')
}
