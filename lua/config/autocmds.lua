-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

require("utils.functions")
vim.api.nvim_create_user_command("FormatJSON", function()
  if require("utils.require_tool").ensure("python3") then
    vim.cmd("%!python3 -m json.tool")
  end
end, { bang = true, desc = "Format json files with python" })

vim.api.nvim_create_user_command("FormatCss", FormatCss, { desc = "Format css using regex" })

vim.api.nvim_create_user_command("RemoveExtraEmptyLines", RemoveExtraEmptyLines, { desc = "Remove extra empty lines" })

vim.api.nvim_create_user_command("AddLineNumbers", AddLineNumbers, { desc = "Add number for the entire file" })

vim.api.nvim_create_user_command("ConvertTabToSpaces", ConvertTabToSpaces, { desc = "Convert Tab to spaces" })

vim.api.nvim_create_user_command("RemoveEmptyLines", RemoveEmptyLines, { desc = "Remove Empty Lines" })

vim.api.nvim_create_user_command("FormatSQL", FormatSQL, { desc = "Format SQL files using sqlformat" })

local function copy_to_clipboard(path, title)
  if path == "" then
    vim.notify("Not a file buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, { title = title })
end

vim.api.nvim_create_user_command("CopyFullPath", function()
  copy_to_clipboard(vim.fs.normalize(vim.fn.expand("%:p")), "Full path copied")
end, { desc = "Copy file full path" })

vim.api.nvim_create_user_command("CopyRelativePath", function()
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
end, { desc = "Copy file path relative to project root" })

vim.api.nvim_create_user_command("DoubleQuotes", DoubleQuotes, { desc = "Replace single quotes with double quotes" })

vim.api.nvim_create_user_command("SingleQuotes", SingleQuotes, { desc = "Replace double quotes with single quotes" })

vim.api.nvim_create_user_command(
  "DoubleQuotesC",
  [[%s/'\([^']*\)'/"\1"/gc]],
  { desc = "Replace single quotes with double quotes with confirmation" }
)

vim.api.nvim_create_user_command(
  "SingleQuotesC",
  [[%s/"\([^"]*\)"/'\1'/gc]],
  { desc = "Replace double quotes with single quotes with confirmation" }
)

vim.api.nvim_create_user_command("UpdateRubyHashesByLines", FormatHashes, { desc = "Update ruby hashes by lines" })

vim.api.nvim_create_user_command("HashNewSyntax", HashNewSyntax, { desc = "update hash old to new syntax" })
vim.api.nvim_create_user_command("HashOldSyntax", HashOldSyntax, { desc = "update hash new to old syntax" })

vim.api.nvim_create_user_command("CleanWhiteSpaces", CleanWhiteSpaces, { desc = "Clean White spaces" })

vim.api.nvim_create_user_command("UnscapeDoubleQuotes", UnscapeDoubleQuotes, { desc = "unscape double quotes" })

vim.api.nvim_create_user_command("RemoveLineBreak", RemoveLineBreak, { desc = "remove line break" })

vim.api.nvim_create_user_command("FormatXML", FormatXML, { desc = "format xml" })

vim.api.nvim_create_user_command(
  "ShowHiName",
  [[:exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')]],
  { desc = "show hi name" }
)

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.api.nvim_create_user_command("ColorScheme", function()
  require("snacks").picker.colorschemes()
end, { desc = "Pick colorscheme (Snacks picker with preview)" })
