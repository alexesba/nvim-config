return {
  'dhruvasagar/vim-table-mode',
  cmd = { 'TableModeToggle', 'TableModeEnable', 'TableModeToggleGithubTable' },
  keys = {
    { '<Leader>to', '<cmd>TableModeToggle<cr>',            noremap = true, silent = true },
    { '<Leader>tr', '<cmd>TableModeRealign<cr>',           noremap = true, silent = true },
    { '<Leader>tg', '<cmd>TableModeToggleGithubTable<cr>', noremap = true, silent = true },
  },
  config = function()
    vim.g.table_mode_corner = '+'
  end
}
