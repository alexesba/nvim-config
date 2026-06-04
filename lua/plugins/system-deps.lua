return {
  {
    dir = vim.fn.stdpath("config"),
    name = "vorbis-tools",
    lazy = false,
    config = function()
      if vim.fn.executable("ogg123") == 1 then
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
    end,
  },
}
