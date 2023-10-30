local cmp_nvim_lsp = prequire('cmp_nvim_lsp')
local lspconfig = prequire('lspconfig')

if (lspconfig) then
  local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
  if (capabilities) then
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      on_attach = OnAttach,
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      }
    })
  end
end
