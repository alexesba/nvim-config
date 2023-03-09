require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'cssls',
    'tsserver',
    'stylelint_lsp',
    'sqlls',
    'solargraph',
    'bashls',
    'eslint'
  },
})
