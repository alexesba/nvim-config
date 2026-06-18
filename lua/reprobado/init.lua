local M = {}

---@class ReprobadoConfig
---@field sounds_dir string|nil  default: stdpath("config")/sounds
---@field player string            default: ogg123

---@param opts ReprobadoConfig|nil
function M.setup(opts)
  opts = opts or {}
  M._sounds_dir = opts.sounds_dir or (vim.fn.stdpath("config") .. "/sounds")
  M._player = opts.player or "ogg123"
end

--- Try to install vorbis-tools (ogg123) when missing. Used by the vorbis-tools lazy spec.
function M.ensure_player()
  M.setup()

  if vim.fn.executable(M._player) == 1 then
    return
  end

  local uname = vim.fn.system("uname"):gsub("%s+", "")
  local cmd

  if uname == "Darwin" then
    if vim.fn.executable("brew") == 1 then
      cmd = { "brew", "install", "vorbis-tools" }
    else
      vim.notify("Homebrew not found. Install it from https://brew.sh to get ogg123.", vim.log.levels.WARN)
      return
    end
  elseif uname == "Linux" then
    if vim.fn.executable("apt-get") == 1 then
      cmd = { "sudo", "apt-get", "install", "-y", "vorbis-tools" }
    elseif vim.fn.executable("pacman") == 1 then
      cmd = { "sudo", "pacman", "-S", "--noconfirm", "vorbis-tools" }
    elseif vim.fn.executable("dnf") == 1 then
      cmd = { "sudo", "dnf", "install", "-y", "vorbis-tools" }
    elseif vim.fn.executable("zypper") == 1 then
      cmd = { "sudo", "zypper", "install", "-y", "vorbis-tools" }
    else
      vim.notify("No supported package manager found. Please install vorbis-tools manually.", vim.log.levels.WARN)
      return
    end
  else
    vim.notify("Unsupported OS for automatic vorbis-tools install. Install ogg123 manually.", vim.log.levels.WARN)
    return
  end

  vim.notify("ogg123 not found — installing vorbis-tools...", vim.log.levels.INFO)

  vim.fn.jobstart(cmd, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("vorbis-tools installed successfully!", vim.log.levels.INFO)
      else
        vim.notify("Failed to install vorbis-tools (exit code " .. code .. ").", vim.log.levels.ERROR)
      end
    end,
  })
end

---@param filename string
function M.play(filename)
  if not M._sounds_dir then
    M.setup()
  end

  if vim.fn.executable(M._player) ~= 1 then
    vim.notify(
      ("%s not found — install vorbis-tools (ogg123)."):format(M._player),
      vim.log.levels.WARN
    )
    return
  end

  local path = M._sounds_dir .. "/" .. filename
  if vim.fn.filereadable(path) ~= 1 then
    vim.notify(("reprobado: missing sound file %s"):format(path), vim.log.levels.ERROR)
    return
  end

  vim.cmd(("silent! AsyncRun %s %s"):format(M._player, vim.fn.shellescape(path)))
end

function M.setup_commands()
  vim.api.nvim_create_user_command("Reprobado", function()
    M.play("Reprobado.ogg")
  end, { desc = "Play Reprobado sound" })

  vim.api.nvim_create_user_command("Reprobada", function()
    M.play("Reprobada.ogg")
  end, { desc = "Play Reprobada sound" })
end

return M
