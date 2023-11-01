local ReloadColorSchemes = vim.api.nvim_create_augroup(
  "ReloadColorSchemes", { clear = true }
)

vim.api.nvim_create_autocmd(
  { "ColorScheme", "VimEnter" }, {
    group = ReloadColorSchemes,
    callback = ConfigItalicFonts
  })
