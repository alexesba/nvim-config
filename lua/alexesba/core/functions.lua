local cmdPreserveCursorPosition = require('alexesba.utils.cmdPreservePosition')

function PlayAudio(file)
  local audio_dir = vim.fn.stdpath('config') .. '/lua/alexesba/ogg-files/'
  local file_path = 'ogg123 ' .. audio_dir .. file
  vim.api.nvim_call_function('asyncrun#run', { '!', '', file_path })
end

function FormatCss()
  cmdPreserveCursorPosition([[silent! :%s/[{;}]/&\r/g|norm! =gg]])
end

function FormatXML()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd [[
    silent! %s/\\"/"/g |
    silent! %s/\\n//g |
    silent! %!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
  ]]
  vim.fn.setpos('.', save_cursor)
end

function RemoveExtraEmptyLines()
  cmdPreserveCursorPosition([[%!cat -s]])
end

function ConvertTabToSpaces()
  cmdPreserveCursorPosition([[%s/\t/  /g]])
end

function RemoveEmptyLines()
  cmdPreserveCursorPosition([[g/^$/d]])
end

function FormatSQL()
  cmdPreserveCursorPosition([[
  '%!sqlformat --reindent --keywords upper --identifiers lower -'
  ]])
end

function FormatSQLV2()
  cmdPreserveCursorPosition([[%!sql-formatter-cli]])
end

function DoubleQuotes()
  cmdPreserveCursorPosition([[%s/'\([^']*\)'/"\1"/g]])
end

function SingleQuotes()
  cmdPreserveCursorPosition([[%s/"\([^"]*\)"/'\1'/g]])
end

function FormatHashes()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd [[
    silent! %s/:\([^ ]*\)\(\s*\)=>/\1: /g |
    silent! %s/}, {/},\r {/g |
    silent! %s/"\([^"]*\)"/'\1'/g
  ]]
  vim.cmd.normal(
    vim.api.nvim_replace_termcodes('gg<S-v><S-g>=', true, true, true)
  )
  vim.fn.setpos('.', save_cursor)
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
