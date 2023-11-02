local merge = Prequire('alexesba.utils.merge')
local cmp_nvim_lsp = Prequire('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()

local function buildSettings(settings)
  return merge and merge({ on_attach = OnAttach, capabilities = capabilities }, settings )
end

return buildSettings;
