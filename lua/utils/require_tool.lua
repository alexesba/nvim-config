local M = {}

---@class ToolSpec
---@field bin string|string[]
---@field label string
---@field install table<string, string>

local tools = {
  python3 = {
    bin = "python3",
    label = "Python 3",
    install = {
      Darwin = "brew install python",
      Linux_apt = "sudo apt-get install -y python3",
      Linux_pacman = "sudo pacman -S --noconfirm python",
      Linux_dnf = "sudo dnf install -y python3",
      Linux_zypper = "sudo zypper install -y python3",
      fallback = "Install Python 3 from https://www.python.org/downloads/",
    },
  },
  sqlformat = {
    bin = "sqlformat",
    label = "sqlformat (sqlparse)",
    install = {
      Darwin = "pip3 install sqlparse",
      Linux_apt = "sudo apt-get install -y python3-sqlparse",
      Linux_pacman = "pip3 install sqlparse",
      Linux_dnf = "pip3 install sqlparse",
      Linux_zypper = "pip3 install sqlparse",
      fallback = "pip3 install sqlparse",
    },
  },
  ["sql-formatter-cli"] = {
    bin = "sql-formatter-cli",
    label = "sql-formatter-cli",
    install = {
      Darwin = "npm install -g sql-formatter-cli",
      Linux_apt = "npm install -g sql-formatter-cli",
      Linux_pacman = "npm install -g sql-formatter-cli",
      Linux_dnf = "npm install -g sql-formatter-cli",
      Linux_zypper = "npm install -g sql-formatter-cli",
      fallback = "npm install -g sql-formatter-cli",
    },
  },
  underscore = {
    bin = "underscore",
    label = "underscore-cli",
    install = {
      Darwin = "npm install -g underscore-cli",
      Linux_apt = "npm install -g underscore-cli",
      Linux_pacman = "npm install -g underscore-cli",
      Linux_dnf = "npm install -g underscore-cli",
      Linux_zypper = "npm install -g underscore-cli",
      fallback = "npm install -g underscore-cli",
    },
  },
  cat = {
    bin = "cat",
    label = "cat",
    install = {
      fallback = "cat should be provided by your OS coreutils package",
    },
  },
}

local function linux_install_key()
  if vim.fn.executable("apt-get") == 1 then
    return "Linux_apt"
  end
  if vim.fn.executable("pacman") == 1 then
    return "Linux_pacman"
  end
  if vim.fn.executable("dnf") == 1 then
    return "Linux_dnf"
  end
  if vim.fn.executable("zypper") == 1 then
    return "Linux_zypper"
  end
end

function M.install_hint(spec)
  local uname = vim.fn.system("uname"):gsub("%s+", "")

  if uname == "Darwin" and spec.install.Darwin then
    return spec.install.Darwin
  end

  if uname == "Linux" then
    local key = linux_install_key()
    if key and spec.install[key] then
      return spec.install[key]
    end
  end

  return spec.install.fallback
end

function M.available(spec)
  local bins = type(spec.bin) == "table" and spec.bin or { spec.bin }

  for _, bin in ipairs(bins) do
    if vim.fn.executable(bin) == 1 then
      return true
    end
  end

  return false
end

---@param name string
---@return boolean
function M.ensure(name)
  local spec = tools[name]
  if not spec then
    vim.notify(("Unknown tool: %s"):format(name), vim.log.levels.ERROR)
    return false
  end

  if M.available(spec) then
    return true
  end

  vim.notify(
    ("%s not found — install with: %s"):format(spec.label, M.install_hint(spec)),
    vim.log.levels.WARN
  )
  return false
end

return M
