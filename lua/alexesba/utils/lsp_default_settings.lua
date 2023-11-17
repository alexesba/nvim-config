local merge = require('alexesba.utils.merge')
local on_attach = require('alexesba.utils.on_attach')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local function buildSettings(settings)
  return merge and merge({
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities()
  }, settings)
end

return buildSettings;
