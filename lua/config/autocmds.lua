-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local commands = require("utils.commands")

-- Formatting commands
vim.api.nvim_create_user_command("FormatCss", commands.FormatCss, { desc = "Format CSS/SCSS with Prettier" })
vim.api.nvim_create_user_command("FormatJSON", commands.FormatJSON, { desc = "Format json files with python" })
vim.api.nvim_create_user_command("FormatSQL", commands.FormatSQL, { desc = "Format SQL with sqlformat (sqlparse)" })
vim.api.nvim_create_user_command("FormatSQLFormatter", commands.FormatSQLFormatter, {
  desc = "Format SQL with sql-formatter-cli (npm)",
})
vim.api.nvim_create_user_command("FormatSQLV2", commands.FormatSQLFormatter, {
  desc = "Alias for FormatSQLFormatter (sql-formatter-cli)",
})
vim.api.nvim_create_user_command("FormatXML", commands.FormatXML, { desc = "format xml" })

-- Text transformation commands
vim.api.nvim_create_user_command("AddLineNumbers", commands.AddLineNumbers, { desc = "Add number for the entire file" })
vim.api.nvim_create_user_command("CleanWhiteSpaces", commands.CleanWhiteSpaces, { desc = "Clean White spaces" })
vim.api.nvim_create_user_command("ConvertTabToSpaces", commands.ConvertTabToSpaces, { desc = "Convert Tab to spaces" })
vim.api.nvim_create_user_command("RemoveEmptyLines", commands.RemoveEmptyLines, {
  desc = "Remove all blank lines (including whitespace-only)",
})
vim.api.nvim_create_user_command("RemoveExtraEmptyLines", commands.RemoveExtraEmptyLines, {
  desc = "Collapse multiple blank lines to one between functions/blocks",
})
vim.api.nvim_create_user_command("RemoveLineBreak", commands.RemoveLineBreak, { desc = "remove line break" })
vim.api.nvim_create_user_command("UnscapeDoubleQuotes", commands.UnscapeDoubleQuotes, { desc = "unscape double quotes" })

-- Quote conversion commands
vim.api.nvim_create_user_command("DoubleQuotes", commands.DoubleQuotes, { desc = "Replace single quotes with double quotes" })
vim.api.nvim_create_user_command(
  "DoubleQuotesC",
  commands.DoubleQuotesC,
  { desc = "Replace single quotes with double quotes with confirmation" }
)
vim.api.nvim_create_user_command("SingleQuotes", commands.SingleQuotes, { desc = "Replace double quotes with single quotes" })
vim.api.nvim_create_user_command(
  "SingleQuotesC",
  commands.SingleQuotesC,
  { desc = "Replace double quotes with single quotes with confirmation" }
)

-- Ruby hash commands
vim.api.nvim_create_user_command("FormatHashes", commands.FormatHashes, {
  desc = "Alias for UpdateRubyHashesByLines",
})
vim.api.nvim_create_user_command("HashNewSyntax", commands.HashNewSyntax, { desc = "update hash old to new syntax" })
vim.api.nvim_create_user_command("HashOldSyntax", commands.HashOldSyntax, { desc = "update hash new to old syntax" })
vim.api.nvim_create_user_command("UpdateRubyHashesByLines", commands.FormatHashes, {
  desc = "Normalize Ruby hashes: rocket→new syntax, split }, {, single quotes, re-indent",
})

-- Clipboard / path commands
vim.api.nvim_create_user_command("CopyFullPath", commands.CopyFullPath, { desc = "Copy file full path" })
vim.api.nvim_create_user_command(
  "CopyRelativePath",
  commands.CopyRelativePath,
  { desc = "Copy file path relative to project root" }
)

-- Misc commands
vim.api.nvim_create_user_command("ColorScheme", commands.ColorScheme, { desc = "Pick colorscheme (Snacks picker with preview)" })
vim.api.nvim_create_user_command("ShowHiName", commands.ShowHiName, { desc = "show hi name" })

-- Autocmds
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
