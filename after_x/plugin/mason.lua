local mason = prequire('mason')
local mason_lspconfig = prequire('mason-lspconfig')

if (mason) then
  mason.setup()
end

if (mason_lspconfig) then
  mason_lspconfig.setup({
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
end
