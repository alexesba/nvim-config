return {
  lazy = true,
  'dhruvasagar/vim-table-mode',
  ft = { 'md', 'markdown' },
  cmd = { 'TableModeToggle', 'TableModeEnable', 'TableModeToggleGithubTable' },
  keys = {
    { '<Leader>to', '<cmd>TableModeToggle<cr>',            noremap = true, silent = true },
    { '<Leader>tr', '<cmd>TableModeRealign<cr>',           noremap = true, silent = true },
    { '<Leader>tg', '<cmd>TableModeToggleGithubTable<cr>', noremap = true, silent = true },
  },
  config = function()
    vim.g.table_mode_corner = '+'
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
  end
}
