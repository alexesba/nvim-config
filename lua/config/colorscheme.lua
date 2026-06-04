local M = {}

M.path = vim.fn.stdpath("state") .. "/last-colorscheme"

function M.get()
  if vim.fn.filereadable(M.path) ~= 1 then
    return nil
  end
  local scheme = vim.fn.trim((vim.fn.readfile(M.path)[1] or ""))
  if scheme == "" then
    return nil
  end
  return scheme
end

function M.save(name)
  if not name or name == "" then
    return
  end
  vim.fn.writefile({ name }, M.path, "S")
end

function M.apply(scheme)
  pcall(require("lazy.core.loader").colorscheme, scheme)
  local ok, err = pcall(vim.cmd.colorscheme, scheme)
  if not ok then
    vim.notify("Could not load colorscheme '" .. scheme .. "': " .. err, vim.log.levels.WARN)
    return false
  end
  return true
end

function M.fallback()
  pcall(require("lazy.core.loader").colorscheme, "tokyonight")
  local ok, err = pcall(function()
    require("tokyonight").load()
  end)
  if not ok then
    vim.notify("Could not load fallback colorscheme tokyonight: " .. err, vim.log.levels.WARN)
    return false
  end
  return true
end

return M
