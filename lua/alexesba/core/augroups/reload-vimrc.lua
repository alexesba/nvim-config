local ReloadVimrc = vim.api.nvim_create_augroup(
  'ReloadVimrc', { clear = true }
)


vim.api.nvim_create_autocmd(
  'BufWritePost', {
    pattern = {
      '*/.config/nvim/**/*.lua',
      '*/.vimrc',
    },
    command = 'source $MYVIMRC | source %',
    group = ReloadVimrc
  })
