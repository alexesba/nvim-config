-- Custom buffer-editing commands, exposed as ex-commands via config/autocmds.lua.
-- Kept as a module (instead of globals) so callers must `require("utils.commands")`.
local preserve_cursor = require("utils.cmdPreservePosition")
local require_tool = require("utils.require_tool")
local format = require("utils.format")

local M = {}

local function with_tool(tool, fn)
  if not require_tool.ensure(tool) then
    return
  end
  fn()
end

--- Run a `:substitute` command, preserving the cursor, and notify the user
--- with the result instead of letting a "Pattern not found" (E486) error
--- surface when the pattern has no matches.
---@param cmd string A substitute command using the `e` flag, e.g. [[%s/\t/  /ge]]
---@param label string Human-readable name of the operation, used in notifications
local function substitute(cmd, label)
  preserve_cursor(function()
    local report = vim.o.report
    vim.o.report = 0
    local ok, msg = pcall(vim.fn.execute, cmd)
    vim.o.report = report

    if not ok then
      vim.notify(("%s failed: %s"):format(label, msg), vim.log.levels.ERROR)
      return
    end

    if msg == "" then
      vim.notify(("%s: no matches found"):format(label), vim.log.levels.INFO)
    else
      vim.notify(("%s: %s"):format(label, vim.trim(msg)), vim.log.levels.INFO)
    end
  end)
end

function M.FormatCss()
  format.run({ "prettier" }, "Format CSS")
end

function M.FormatXML()
  with_tool("python3", function()
    preserve_cursor([[
      silent! %s/\\"/"/g |
      silent! %s/\\n//g
    ]])
    format.run({ "xml_minidom" }, "Format XML")
  end)
end

--- Collapse consecutive blank lines (including whitespace-only) to one empty line.
function M.RemoveExtraEmptyLines()
  preserve_cursor(function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local result = {}
    local in_blank_run = false

    for _, line in ipairs(lines) do
      if line:match("^%s*$") then
        if not in_blank_run then
          result[#result + 1] = ""
          in_blank_run = true
        end
      else
        in_blank_run = false
        result[#result + 1] = line
      end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, true, result)
  end)
end

function M.ConvertTabToSpaces()
  substitute([[%s/\t/  /ge]], "ConvertTabToSpaces")
end

--- Remove all blank lines (including whitespace-only).
function M.RemoveEmptyLines()
  preserve_cursor(function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local result = {}

    for _, line in ipairs(lines) do
      if not line:match("^%s*$") then
        result[#result + 1] = line
      end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, true, result)
  end)
end

function M.FormatSQL()
  format.run({ "sqlformat" }, "Format SQL")
end

function M.FormatJSON()
  format.run({ "json_tool" }, "Format JSON")
end

function M.FormatSQLFormatter()
  format.run({ "sql_formatter_cli" }, "Format SQL")
end

function M.DoubleQuotes()
  substitute([[%s/'\([^']*\)'/"\1"/ge]], "DoubleQuotes")
end

function M.SingleQuotes()
  substitute([[%s/"\([^"]*\)"/'\1'/ge]], "SingleQuotes")
end

--- Normalize multi-line Ruby hashes in the current buffer.
---
--- Steps (order preserved; no sorting or column alignment):
---   1. `:key =>` → `key: ` (old rocket syntax to new, with space after `:`)
---   2. `}, {` → `},\n {` (split two inline hashes onto separate lines)
---   3. `"…"` → `'…'` (double quotes to single quotes)
---   4. `ggVG=` — re-indent the buffer (Ruby indent when `filetype=ruby`)
---
--- Commands: `:UpdateRubyHashesByLines`, `:FormatHashes` (alias).
function M.FormatHashes()
  preserve_cursor(function()
    vim.cmd([[
      silent! %s/:\([^ ]*\)\(\s*\)=>/\1: /g |
      silent! %s/}, {/},\r {/g |
      silent! %s/"\([^"]*\)"/'\1'/g
    ]])
    vim.cmd.normal(vim.api.nvim_replace_termcodes("gg<S-v><S-g>=", true, true, true))
  end)
end

function M.HashNewSyntax()
  substitute([[%s/:\([^ ]*\)\(\s*\)=>/\1:/ge]], "HashNewSyntax")
end

--- Convert new hash syntax (`key: value`) back to the old rocket syntax
--- (`:key => value`), regardless of the value's type (string, symbol,
--- number, array, etc.). Only the `key: ` portion is matched/replaced;
--- the value is left untouched.
function M.HashOldSyntax()
  substitute([[%s/\(\w\+\): /:\1 => /ge]], "HashOldSyntax")
end

function M.UnscapeDoubleQuotes()
  substitute([[%s/\\"//ge]], "UnscapeDoubleQuotes")
end

function M.RemoveLineBreak()
  substitute([[%s/\\n//ge]], "RemoveLineBreak")
end

function M.CleanWhiteSpaces()
  preserve_cursor([[%s/\s\+$//e]])
end

function M.AddLineNumbers()
  preserve_cursor([[%s/^/\=printf('%-2d', line('.'))]])
end

function M.DoubleQuotesC()
  preserve_cursor([[%s/'\([^']*\)'/"\1"/gce]])
end

function M.SingleQuotesC()
  preserve_cursor([[%s/"\([^"]*\)"/'\1'/gce]])
end

function M.ShowHiName()
  vim.cmd([[exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')]])
end

function M.ColorScheme()
  require("snacks").picker.colorschemes()
end

local function copy_to_clipboard(path, title)
  if path == "" then
    vim.notify("Not a file buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, { title = title })
end

function M.CopyFullPath()
  copy_to_clipboard(vim.fs.normalize(vim.fn.expand("%:p")), "Full path copied")
end

function M.CopyRelativePath()
  local full = vim.fs.normalize(vim.fn.expand("%:p"))
  if full == "" then
    vim.notify("Not a file buffer", vim.log.levels.WARN)
    return
  end

  local root = LazyVim.root({ normalize = true })
  local rel = root and vim.fs.relpath(root, full) or nil

  -- File outside project root: fall back to path relative to cwd
  if not rel or vim.startswith(rel, "..") then
    rel = vim.fn.fnamemodify(full, ":~:.")
  end

  copy_to_clipboard(rel, "Relative path copied")
end

return M
