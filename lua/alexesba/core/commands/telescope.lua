local telescope = require('telescope')

if (telescope) then
  vim.api.nvim_create_user_command(
    'ColorScheme',
    require('telescope.builtin').colorscheme,
    { desc = 'Reload VIMRC file' }
  )
end
