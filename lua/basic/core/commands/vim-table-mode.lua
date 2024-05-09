vim.api.nvim_create_user_command(
  'GithubTableModeToggle',
  function()
    if vim.g.table_mode_corner == '|' then
      vim.g.table_mode_corner = '+'
    else
      vim.g.table_mode_corner = '|'
    end
  end,
  { desc = "toggle git hub table mode" }
)
