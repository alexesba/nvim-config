local lspconfig = prequire('lspconfig')
local cmp_nvim_lsp = prequire('cmp_nvim_lsp')

if (lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
  if (capabilities) then
    lspconfig.grammarly.setup({
      on_attach = OnAttach,
      capabilities = capabilities,
      filetypes = { "markdown", "text", "md" },
      init_options = {
        clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
      },
    })
  end
end
