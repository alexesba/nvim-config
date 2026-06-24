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
  cmdPreserveCursorPosition([[silent! :%s/[{;}]/&\r/g|norm! =gg]])
end

function FormatXML()
  if not require_tool.ensure("python3") then
    return
  end
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[
    silent! %s/\\"/"/g |
    silent! %s/\\n//g
  ]])
  format.run({ "xml_minidom" }, "Format XML")
  vim.fn.setpos(".", save_cursor)
end

function RemoveExtraEmptyLines()
  with_tool("cat", function()
    cmdPreserveCursorPosition([[%!cat -s]])
  end)
end

function ConvertTabToSpaces()
  cmdPreserveCursorPosition([[%s/\t/  /g]])
end

function RemoveEmptyLines()
  cmdPreserveCursorPosition([[g/^$/d]])
end

function FormatSQL()
  format.run({ "sqlformat" }, "Format SQL")
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
