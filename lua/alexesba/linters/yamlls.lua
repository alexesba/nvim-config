local lspServer = require('alexesba.utils.lspServer')

lspServer.configure('yamlls', {
  settings = {
    yaml = {
      schemas = {
        ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
      },
    },
  }
})
