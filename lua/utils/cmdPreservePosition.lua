local M = {}

--- Run a Vim command or Lua function, then restore the cursor position.
---@param action string|function
---@param ... any Arguments passed when action is a function
---@return ... Return values from action when it is a function
function M.with_cursor(action, ...)
  local pos = vim.fn.getpos(".")
  if type(action) == "function" then
    local ret = { action(...) }
    vim.fn.setpos(".", pos)
    return unpack(ret, 1, ret.n)
  end
  vim.cmd(action)
  vim.fn.setpos(".", pos)
end

setmetatable(M, {
  __call = function(_, action, ...)
    return M.with_cursor(action, ...)
  end,
})

return M
