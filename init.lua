-- Disable Kitty keyboard protocol to avoid double Enter/Tab/Backspace on
-- Kitty and Alacritty (common on WSL GUI terminals with Neovim 0.11+).
local function kitty_protocol_terminal()
  local term = vim.env.TERM or ""
  if term:match("kitty") or term:match("alacritty") then
    return true
  end
  return vim.env.KITTY_WINDOW_ID ~= nil or vim.env.ALACRITTY_WINDOW_ID ~= nil
end

if kitty_protocol_terminal() then
  vim.api.nvim_create_autocmd({ "VimEnter", "VimLeavePre" }, {
    callback = function(ev)
      if ev.event == "VimEnter" then
        io.stdout:write("\027[>1u")
      else
        io.stdout:write("\027[<1u")
      end
    end,
  })
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
