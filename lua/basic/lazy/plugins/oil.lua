return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-web-devicons' },
  cmd = { 'Exp', 'Explore', 'Explorer' },
  keys = {
    {
      '-',
      function()
        require('oil').open()
      end,
      desc = 'Open Parent Directory',
      noremap = true
    }
  },
  config = function(_, opts)
    require('oil').setup(opts)

    vim.api.nvim_create_user_command(
      'Explorer',
      function()
        require('oil').open()
      end,
      { desc = 'Open Current Directory' }
    )

    vim.api.nvim_create_user_command(
      'Explore',
      function()
        require('oil').open()
      end,
      { desc = 'Open Current Directory' }
    )

    vim.api.nvim_create_user_command(
      'Exp',
      function()
        require('oil').open()
      end,
      { desc = 'Open Current Directory' }
    )
  end
}
