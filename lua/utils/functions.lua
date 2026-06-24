local cmdPreserveCursorPosition = require("utils.cmdPreservePosition")
local require_tool = require("utils.require_tool")
local format = require("utils.format")

local function with_tool(tool, fn)
  if not require_tool.ensure(tool) then
    return
  end
  fn()
end

function FormatCss()
  format.run({ "prettier" }, "Format CSS")
end

function FormatXML()
  with_tool("python3", function()
    cmdPreserveCursorPosition([[
      silent! %s/\\"/"/g |
      silent! %s/\\n//g
    ]])
    format.run({ "xml_minidom" }, "Format XML")
  end)
end

--- Collapse consecutive blank lines (including whitespace-only) to one empty line.
function RemoveExtraEmptyLines()
  local save_cursor = vim.fn.getpos(".")
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
  vim.fn.setpos(".", save_cursor)
end

function ConvertTabToSpaces()
  cmdPreserveCursorPosition([[%s/\t/  /g]])
end

--- Remove all blank lines (including whitespace-only).
function RemoveEmptyLines()
  local save_cursor = vim.fn.getpos(".")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local result = {}

  for _, line in ipairs(lines) do
    if not line:match("^%s*$") then
      result[#result + 1] = line
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, true, result)
  vim.fn.setpos(".", save_cursor)
end

function FormatSQL()
  format.run({ "sqlformat" }, "Format SQL")
end

function FormatJSON()
  format.run({ "json_tool" }, "Format JSON")
end

function FormatSQLFormatter()
  format.run({ "sql_formatter_cli" }, "Format SQL")
end

function DoubleQuotes()
  cmdPreserveCursorPosition([[%s/'\([^']*\)'/"\1"/g]])
end

function SingleQuotes()
  cmdPreserveCursorPosition([[%s/"\([^"]*\)"/'\1'/g]])
end

function FormatHashes()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[
    silent! %s/:\([^ ]*\)\(\s*\)=>/\1: /g |
    silent! %s/}, {/},\r {/g |
    silent! %s/"\([^"]*\)"/'\1'/g
  ]])
  vim.cmd.normal(vim.api.nvim_replace_termcodes("gg<S-v><S-g>=", true, true, true))
  vim.fn.setpos(".", save_cursor)
end

function HashNewSyntax()
  cmdPreserveCursorPosition([[:%s/:\([^ ]*\)\(\s*\)=>/\1:/g]])
end

function HashOldSyntax()
  cmdPreserveCursorPosition([[:%s/\(\w*\): \([':]\)/:\1 => \2/g]])
end

function UnscapeDoubleQuotes()
  cmdPreserveCursorPosition([[%s/\\"//g]])
end

function RemoveLineBreak()
  cmdPreserveCursorPosition([[%s/\\n//g]])
end

function CleanWhiteSpaces()
  cmdPreserveCursorPosition([[%s/\s\+$//e]])
end

function AddLineNumbers()
  cmdPreserveCursorPosition([[%s/^/\=printf('%-2d', line('.'))]])
end
