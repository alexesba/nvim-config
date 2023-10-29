local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').yamlls.setup({
  capabilities = capabilities,
  on_attach = OnAttach,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  }
});
