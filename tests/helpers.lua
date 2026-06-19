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

--- Temporarily replace vim.fn entries; restores originals after fn runs.
function M.with_mocked_fn(overrides, fn)
  local original = {}
  for key, value in pairs(overrides) do
    original[key] = vim.fn[key]
    vim.fn[key] = value
  end

  local results = { fn() }

  for key, value in pairs(original) do
    vim.fn[key] = value
  end

  return unpack(results)
end

return M
