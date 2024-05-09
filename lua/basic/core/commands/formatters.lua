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
  FormatCss,
  { desc = 'Format css using regex' }
)

vim.api.nvim_create_user_command(
  'RemoveExtraEmptyLines',
  RemoveExtraEmptyLines,
  { desc = 'Remove extra empty lines' }
)

vim.api.nvim_create_user_command(
  'AddLineNumbers',
  AddLineNumbers,
  { desc = 'Add number for the entire file' }
)

vim.api.nvim_create_user_command(
  'ConvertTabToSpaces',
  ConvertTabToSpaces,
  { desc = 'Convert Tab to spaces' }
)

vim.api.nvim_create_user_command(
  'RemoveEmptyLines',
  RemoveEmptyLines,
  { desc = 'Remove Empty Lines' }
)

vim.api.nvim_create_user_command(
  'FormatSQL',
  FormatSQL,
  { desc = 'Format SQL files using sqlformat' }
)

vim.api.nvim_create_user_command(
  'FormatSQLV2',
  FormatSQLV2,
  { desc = 'Format SQL using sql-formatter-cli' }
)

vim.api.nvim_create_user_command(
  'CopyFullPath',
  [[let @+= expand('%:p')]],
  { desc = 'Copy file full path' }
)

vim.api.nvim_create_user_command(
  'CopyRelativePath',
  [[let @+= expand('%')]],
  { desc = 'Copy file relative path' }
)

vim.api.nvim_create_user_command(
  'DoubleQuotes',
  DoubleQuotes,
  { desc = 'Replace single quotes with double quotes' }
)

vim.api.nvim_create_user_command(
  'SingleQuotes',
  SingleQuotes,
  { desc = 'Replace double quotes with single quotes' }
)

vim.api.nvim_create_user_command(
  'DoubleQuotesC',
  [[%s/'\([^']*\)'/"\1"/gc]],
  { desc = 'Replace single quotes with double quotes with confirmation' }
)

vim.api.nvim_create_user_command(
  'SingleQuotesC',
  [[%s/"\([^"]*\)"/'\1'/gc]],
  { desc = 'Replace double quotes with single quotes with confirmation' }
)

vim.api.nvim_create_user_command(
  'UpdateRubyHashesByLines',
  FormatHashes,
  { desc = 'Update ruby hashes by lines' }
)

vim.api.nvim_create_user_command(
  'HashNewSyntax',
  HashNewSyntax,
  { desc = 'update hash old to new syntax' }
)
vim.api.nvim_create_user_command(
  'HashOldSyntax',
  HashOldSyntax,
  { desc = 'update hash new to old syntax' }
)

vim.api.nvim_create_user_command(
  'HashNewSyntax',
  HashOldSyntax,
  { desc = 'update hash syntax' }
)

vim.api.nvim_create_user_command(
  'CleanWhiteSpaces',
  CleanWhiteSpaces,
  { desc = 'Clean White spaces' }
)

vim.api.nvim_create_user_command(
  'UnscapeDoubleQuotes',
  UnscapeDoubleQuotes,
  { desc = 'unscape double quotes' }
)

vim.api.nvim_create_user_command(
  'RemoveLineBreak',
  RemoveLineBreak,
  { desc = 'remove line break' }
)

vim.api.nvim_create_user_command(
  'FormatXML',
  FormatXML,
  { desc = 'format xml' }
)

vim.api.nvim_create_user_command(
  'ShowHiName',
  [[:exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')]],
  { desc = 'show hi name' }
)
vim.api.nvim_create_user_command(
  'Reprobado',
  [[silent!:lua PlayAudio('Reprobado.ogg')]],
  { desc = 'Play Reprobado' }
)
vim.api.nvim_create_user_command(
  'Reprobada',
  [[silent!:lua PlayAudio('Reprobada.ogg')]],
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
