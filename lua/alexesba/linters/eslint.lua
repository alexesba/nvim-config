local lspconfig = prequire('lspconfig')
local cmp_nvim_lsp = prequire('cmp_nvim_lsp')

if(lspconfig) then
  local capabilities = cmp_nvim_lsp.default_capabilities()
  if(capabilities) then
    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = OnAttach,
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false
        })
      }
    })
  end
end
