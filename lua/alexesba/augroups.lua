local columnLimit = vim.api.nvim_create_augroup(
  "columnLimit", { clear = true }
)

vim.api.nvim_create_autocmd(
  { "BufRead", "BufEnter" }, {
    command = [[
   highlight ColumnLimit ctermbg=Red guibg=Red
  ]],
    group = columnLimit
  })

local ReloadColorSchemes = vim.api.nvim_create_augroup(
  "ReloadColorSchemes", { clear = true }
)

vim.api.nvim_create_autocmd(
  { "ColorScheme", "VimEnter" }, {
    group = ReloadColorSchemes,
    callback = ConfigItalicFonts
  })

local ReloadVimrc = vim.api.nvim_create_augroup(
  "ReloadVimrc", { clear = true }
)

vim.api.nvim_create_autocmd(
  "BufWritePost", {
    pattern = {
      "*/.config/nvim/**/*.lua",
      "*/.config/nvim/vim-files/plugins.vim",
      "*/.vimrc",
    },
    command = "source $MYVIMRC | source %",
    group = ReloadVimrc
  })

vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' }, {
    pattern = { "*.arb" },
    command = "setfiletype ruby"
  })

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead', 'BufEnter' }, {
    pattern = { "*.jbuilder" },
    command = "setf jbuilder"
  });
