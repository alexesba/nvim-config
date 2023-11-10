local lspServer = {}
local lspconfig = require('lspconfig')
local buildSettings = require('alexesba.utils.lsp_default_settings')

lspServer.configure = function(serverName, settings)
  if(settings == nil) then
    settings = {}
  end
  if (lspconfig == nil) then
    return "no lspconfig found"
  end

  if(buildSettings == nil) then
    return "no utils.lsp_default_settings found"
  end

  local server = lspconfig[serverName]
  if (server) then
    return server.setup(buildSettings(settings))
  else
    print ("server: " .. serverName .. " was not found")
  end
end

return lspServer
