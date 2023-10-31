local cmp_nvim_lsp = prequire('cmp_nvim_lsp')
local lspconfig = prequire('lspconfig')


if(lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = OnAttach,
})
end
