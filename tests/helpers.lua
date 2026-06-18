local M = {}

function M.root()
  return vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
end

function M.temp_dir()
  local dir = M.root() .. "/.test-state/" .. vim.fn.tempname():match("([^/]+)$")
  vim.fn.mkdir(dir, "p")
  return dir
end

function M.reload_reprobado()
  package.loaded["reprobado"] = nil
end

function M.touch(path)
  local f = io.open(path, "w")
  if f then
    f:close()
  end
end

return M
