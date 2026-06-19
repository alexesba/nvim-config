local M = {}

--- Kitty/Alacritty on WSL often reports a generic $TERM; detect via env too.
function M.needs_key_protocol_fix()
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

--- Neovim 0.11+ enables CSI-u / kitty protocol after startup; disable it.
function M.disable_key_protocol()
  io.stdout:write("\027[>0u\027[<1u")
  io.stdout:flush()
end

function M.setup()
  if not M.needs_key_protocol_fix() then
    return
  end

  M.disable_key_protocol()

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Neovim may re-enable the protocol after VimEnter; apply twice to be sure.
      vim.defer_fn(M.disable_key_protocol, 0)
      vim.defer_fn(M.disable_key_protocol, 100)
    end,
  })

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      io.stdout:write("\027[<1u")
      io.stdout:flush()
    end,
  })
end

return M
