vim.api.nvim_create_user_command(
  'FormatJSON',
  '%!python3 -m json.tool',
  { bang = true, desc = 'Format json files with python' }
)

vim.api.nvim_create_user_command(
  'FormatJSONV2',
  '%!underscore print --outfmt json',
  { bang = true, desc = 'Format json files using underline-cli' }
)

vim.api.nvim_create_user_command(
  'FormatCss',
  'call FormatCss()',
  { desc = 'Format css using regex' }
)

vim.api.nvim_create_user_command(
  'RemoveExtraEmptyLines',
  function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd [[:%!cat -s]]
    vim.fn.setpos('.', save_cursor)
  end,
  { desc = 'Remove extra empty lines' }
)

vim.api.nvim_create_user_command(
  'AddNumber',
  "%s/^=printf('%-2d', line('.'))",
  { desc = 'Add number for the entire file' }
)

vim.api.nvim_create_user_command(
  'ConvertTabToSpaces',
  '%s/\t/  /g',
  { desc = 'Convert Tab to spaces' }
)

vim.api.nvim_create_user_command(
  'RemoveEmptyLines',
  'g/^$/d',
  { desc = 'Remove Empty Lines' }
)

vim.api.nvim_create_user_command(
  'FormatSQL',
  '%!sqlformat --reindent --keywords upper --identifiers lower -',
  { desc = 'Format SQL files using sqlformat' }
)

vim.api.nvim_create_user_command(
  'FormatSQLV2',
  '%!sql-formatter-cli',
  { desc = 'Format SQL using sql-formatter-cli' }
)

vim.api.nvim_create_user_command(
  'CopyFullPath',
  'let @+= expand("%:p")',
  { desc = 'Copy file full path' }
)

vim.api.nvim_create_user_command(
  'CopyRelativePath',
  'let @+= expand("%")',
  { desc = 'Copy file relative path' }
)

vim.api.nvim_create_user_command(
  'DoubleQuotes',
  [[%s/'\([^']*\)'/"\1"/g]],
  { desc = "Replace single quotes with double quotes" }
)

vim.api.nvim_create_user_command(
  'SingleQuotes',
  [[%s/"\([^"]*\)"/'\1'/g]],
  { desc = "Replace double quotes with single quotes" }
)

vim.api.nvim_create_user_command(
  'DoubleQuotesC',
  [[%s/'\([^']*\)'/"\1"/gc]],
  { desc = "Replace single quotes with double quotes with confirmation" }
)

vim.api.nvim_create_user_command(
  'SingleQuotesC',
  [[%s/"\([^"]*\)"/'\1'/gc]],
  { desc = "Replace double quotes with single quotes with confirmation" }
)

vim.api.nvim_create_user_command(
  'UpdateRubyHashesByLines',
  [[:call FormatHashes()]],
  { desc = "Update ruby hashes by lines" }
)

vim.api.nvim_create_user_command(
  'HashNewSyntax',
  [[:%s/:\([^ ]*\)\(\s*\)=>/\1:/g]],
  { desc = "update hash old to new syntax" }
)
vim.api.nvim_create_user_command(
  'HashOldSyntax',
  [[:%s/\(\w*\): \([':]\)/:\1 => \2/g]],
  { desc = "update hash new to old syntax" }
)

vim.api.nvim_create_user_command(
  'HashNewSyntax',
  [[:%s/:\([^ ]*\)\(\s*\)=>/\1:/g]],
  { desc = "update hash syntax" }
)

vim.api.nvim_create_user_command(
  'FormatBraces',
  [[:call CleanUpReactFile()]],
  { desc = "format braces" }
)


vim.api.nvim_create_user_command(
  'CleanWhiteSpaces',
  function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos('.', save_cursor)
  end,
  { desc = "Clean White spaces" }
)

vim.api.nvim_create_user_command(
  'UnscapeDoubleQuotes',
  [[%s/\\"//g]],
  { desc = "unscape double quotes" }
)

vim.api.nvim_create_user_command(
  'RemoveLineBreak',
  [[%s/\\n//g]],
  { desc = "remove line break" }
)

vim.api.nvim_create_user_command(
  'FormatXML',
  [[:call FormatXMLFn()]],
  { desc = "format xml" }
)

vim.api.nvim_create_user_command(
  'ShowHiName',
  [[:exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')]],
  { desc = "show hi name" }
)

vim.api.nvim_create_user_command(
  'Reprobado',
  [[silent!:lua PlayAudio('~/.config/nvim/Reprobado.ogg')]],
  { desc = 'Play Reprobado' }
)
vim.api.nvim_create_user_command(
  'Reprobada',
  [[silent!:lua PlayAudio('~/.config/nvim/Reprobada.ogg')]],
  { desc = 'Play Reprobada' }
)

vim.api.nvim_create_user_command(
  'OpenConfig',
  [[:e $MYVIMRC]],
  { desc = 'Edit VIMRC file' }
)

vim.api.nvim_create_user_command(
  'Reload',
  [[:so $MYVIMRC]],
  { desc = 'Reload VIMRC file' }
)
