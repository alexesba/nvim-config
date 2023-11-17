return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  keys = {
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files({ file_ignore_patterns = { 'node_modules/*', '.git/**' } })
      end,
      noremap = true,
      silent = true
    },
    { '<leader>fk', function() require('telescope.builtin').grep_string() end, { silent = true, noremap = true } },
    { '<leader>fk', function() require('telescope.builtin').grep_string() end, { silent = true, noremap = true } },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end,   { silent = true, noremap = true } },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,     { silent = true, noremap = true } },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,   { silent = true, noremap = true } },
    { '<leader>fc', function() require('telescope.builtin').colorscheme() end, { silent = true, noremap = true } },
    { '<leader>fm', function() require('telescope.builtin').keymaps() end,     { silent = true, noremap = true } },
  },
  opts = {
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }
  }
}
