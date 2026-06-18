local M = {}

function M.map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true }, opts or {}))
end

return M
