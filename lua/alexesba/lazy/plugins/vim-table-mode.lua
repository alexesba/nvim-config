return {
  'dhruvasagar/vim-table-mode',
  cmd = { 'TableModeToggle', 'TableModeEnable' },
  config = function()
    vim.g.table_mode_corner = '+'
  end
}
