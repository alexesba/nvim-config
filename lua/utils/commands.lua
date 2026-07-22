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
  preserve_cursor([[%s/\t/  /g]])
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
  preserve_cursor([[%s/'\([^']*\)'/"\1"/g]])
end

function M.SingleQuotes()
  preserve_cursor([[%s/"\([^"]*\)"/'\1'/g]])
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
  preserve_cursor([[:%s/:\([^ ]*\)\(\s*\)=>/\1:/g]])
end

--- Convert new hash syntax (`key: value`) back to the old rocket syntax
--- (`:key => value`), regardless of the value's type (string, symbol,
--- number, array, etc.). Only the `key: ` portion is matched/replaced;
--- the value is left untouched.
function M.HashOldSyntax()
  preserve_cursor([[:%s/\(\w\+\): /:\1 => /g]])
end

function M.UnscapeDoubleQuotes()
  preserve_cursor([[%s/\\"//g]])
end

function M.RemoveLineBreak()
  preserve_cursor([[%s/\\n//g]])
end

function M.CleanWhiteSpaces()
  preserve_cursor([[%s/\s\+$//e]])
end

function M.AddLineNumbers()
  preserve_cursor([[%s/^/\=printf('%-2d', line('.'))]])
end

return M
