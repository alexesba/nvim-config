local M = {}

local TOOL_BY_FORMATTER = {
  sqlformat = "sqlformat",
  sql_formatter_cli = "sql-formatter-cli",
  json_tool = "python3",
  xml_minidom = "python3",
}

--- Run conform formatters by name (used by :FormatSQL, :FormatJSON, etc.).
---@param formatters string[]
---@param label? string
---@return boolean
function M.run(formatters, label)
  local require_tool = require("utils.require_tool")

  for _, name in ipairs(formatters) do
    local tool = TOOL_BY_FORMATTER[name]
    if tool and not require_tool.ensure(tool) then
      return false
    end
  end

  local ok, conform = pcall(require, "conform")
  if not ok then
    vim.notify("conform.nvim is not available", vim.log.levels.ERROR)
    return false
  end

  local err = conform.format({
    async = false,
    timeout_ms = 5000,
    lsp_format = "never",
    formatters = formatters,
  })

  if err then
    vim.notify(("%s: %s"):format(label or "Format", err), vim.log.levels.ERROR)
    return false
  end

  return true
end

return M
