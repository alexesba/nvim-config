local util = require 'lspconfig.util'
require'lspconfig'.stylelint_lsp.setup {
--   enable = true,
  filetypes = { 'css', 'less', 'scss', 'sugarss', 'wxss' },
  settings = {
    stylelintplus  = {
      autoFixOnFormat = true
    }
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    })
  },
--   root_dir =  util.root_pattern('.stylelintrc.json', 'package.json')
}
