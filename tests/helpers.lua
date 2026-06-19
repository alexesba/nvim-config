local M = {}

function M.root()
  return vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
end

function M.temp_dir()
  local dir = M.root() .. "/.test-state/" .. vim.fn.tempname():match("([^/]+)$")
  vim.fn.mkdir(dir, "p")
  return dir
end

function M.reload_module(name)
  package.loaded[name] = nil
end

function M.reload_reprobado()
  M.reload_module("reprobado")
end

function M.local_overlay_path(name)
  return vim.fn.stdpath("config") .. "/lua/config/" .. name .. ".local.lua"
end

function M.write_local_overlay(name, content)
  local path = M.local_overlay_path(name)
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
  local f = io.open(path, "w")
  assert(f, "failed to write overlay: " .. path)
  f:write(content)
  f:close()
  return path
end

function M.remove_file(path)
  if path and vim.fn.filereadable(path) == 1 then
    os.remove(path)
  end
end

function M.capture_notify(fn)
  local messages = {}
  local notify = vim.notify
  vim.notify = function(msg, ...)
    messages[#messages + 1] = msg
  end
  fn()
  vim.notify = notify
  return messages
end

function M.command_desc(cmd)
  return cmd.desc or cmd.definition
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
