local M = {}

--- Kitty/Alacritty on WSL often reports a generic $TERM; detect via env too.
function M.needs_key_protocol_fix()
  if vim.env.NVIM_DISABLE_KEY_PROTOCOL == "1" then
    return true
  end

  if vim.env.KITTY_WINDOW_ID or vim.env.ALACRITTY_WINDOW_ID then
    return true
  end

  local term = vim.env.TERM or ""
  if term:match("kitty") or term:match("alacritty") then
    return true
  end

  if vim.env.WSL_DISTRO_NAME and (vim.env.WAYLAND_DISPLAY or vim.env.DISPLAY) then
    return true
  end

  return false
end

--- Neovim 0.12+ enables kitty protocol with flags=3 (disambiguate + report key-up).
--- That makes Enter/Tab/Backspace fire on keydown and keyup in Kitty/Alacritty (#31806).
--- Push flags=1 (disambiguate only) after Neovim starts so each keypress fires once.
function M.fix_key_protocol()
  io.stdout:write("\027[>1u")
  io.stdout:flush()
end

local function schedule_fix()
  for _, delay in ipairs({ 0, 50, 150, 500 }) do
    vim.defer_fn(M.fix_key_protocol, delay)
  end
end

function M.setup()
  if not M.needs_key_protocol_fix() then
    return
  end

  schedule_fix()

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = schedule_fix,
  })

  if vim.fn.exists("##UIEnter") == 1 then
    vim.api.nvim_create_autocmd("UIEnter", {
      once = true,
      callback = schedule_fix,
    })
  end

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      io.stdout:write("\027[<1u")
      io.stdout:flush()
    end,
  })
end

return M
