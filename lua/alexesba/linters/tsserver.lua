local cmp_nvim_lsp = prequire('cmp_nvim_lsp')
local lspconfig = prequire('lspconfig')

if(lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
  if(capabilities) then
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = OnAttach,
      preferences = {
        quotePreference ="auto"
      },
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false
        })
      }
    })
  end
end
