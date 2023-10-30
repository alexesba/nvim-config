local cmp_nvim_lsp = prequire('cmp_nvim_lsp')
local lspconfig = prequire('lspconfig')

if (lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
  if (capabilities) then
    lspconfig.stylelint_lsp.setup({
      filetypes = { 'css', 'less', 'scss', 'sugarss', 'wxss' },
      on_attach = OnAttach,
      capabilities = capabilities,
      settings = {
        stylelintplus = {
          autoFixOnFormat = true
        }
      },
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false
          })
      },
    })
  end
end
