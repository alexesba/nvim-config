local M = {}

--- Load lua/config/<name>.local.lua if present (gitignored user overrides).
function M.load(name)
  local path = vim.fn.stdpath("config") .. "/lua/config/" .. name .. ".local.lua"
  if vim.fn.filereadable(path) ~= 1 then
    return
  end
  local ok, err = pcall(dofile, path)
  if not ok then
    vim.notify(("Failed to load %s.local.lua: %s"):format(name, err), vim.log.levels.WARN)
  end
end

return M
