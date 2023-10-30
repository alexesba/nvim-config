local cmp_nvim_lsp = prequire('cmp_nvim_lsp')
local lspconfig = prequire('lspconfig')

if(lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
  if(capabilities) then
    lspconfig.cucumber_language_server.setup({
      on_attach = OnAttach,
      capabilities = capabilities
    })
  end
end
