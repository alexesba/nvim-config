local M = {}

local TOOL_BY_FORMATTER = {
  sqlformat = "sqlformat",
  sql_formatter_cli = "sql-formatter-cli",
  json_tool = "python3",
  xml_minidom = "python3",
  prettier = "prettier",
}

--- Ensure the current buffer can receive formatter edits.
---@param label string
---@return boolean, table|nil restore options to apply after formatting
local function prepare_buffer(label)
  local bufnr = vim.api.nvim_get_current_buf()
  local buftype = vim.bo[bufnr].buftype
  local readonly = vim.bo[bufnr].readonly
  local modifiable = vim.bo[bufnr].modifiable

  if buftype ~= "" then
    vim.notify(
      ("%s: buffer is not a normal file (buftype=%s)"):format(label, buftype),
      vim.log.levels.ERROR
    )
    return false
  end

  if readonly then
    vim.notify(("%s: buffer is readonly"):format(label), vim.log.levels.ERROR)
    return false
  end

  if modifiable then
    return true, nil
  end

  -- Some plugins leave 'nomodifiable' on an otherwise editable file buffer.
  -- Conform applies edits via nvim_buf_set_text, which requires modifiable.
  vim.bo[bufnr].modifiable = true
  return true, { bufnr = bufnr, modifiable = false }
end

--- Run conform formatters by name (used by :FormatSQL, :FormatJSON, etc.).
---@param formatters string[]
---@param label? string
---@return boolean
function M.run(formatters, label)
  label = label or "Format"
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

  local prepared, restore = prepare_buffer(label)
  if not prepared then
    return false
  end

  local format_err
  local ran, err = pcall(function()
    conform.format({
      async = false,
      timeout_ms = 5000,
      lsp_format = "never",
      formatters = formatters,
    }, function(cb_err)
      format_err = cb_err
    end)
  end)

  if restore then
    vim.bo[restore.bufnr].modifiable = restore.modifiable
  end

  if not ran then
    vim.notify(("%s: %s"):format(label, err), vim.log.levels.ERROR)
    return false
  end

  if format_err then
    vim.notify(("%s: %s"):format(label, format_err), vim.log.levels.ERROR)
    return false
  end

  return true
end

return M
