local function cmdPreserveCursorPosition(cmd)
  local save_cursor = vim.fn.getpos(".")
  vim.cmd(cmd)
  vim.fn.setpos('.', save_cursor)
end

return cmdPreserveCursorPosition
