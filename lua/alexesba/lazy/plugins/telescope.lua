return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  keys = {
    { "<leader>fk", function() require("telescope.builtin").grep_string() end, { silent = true, noremap = true } },
    { "<leader>fk", function() require("telescope.builtin").grep_string() end, { silent = true, noremap = true } },
    { "<leader>fg", function() require("teelscope.builtin").live_grep() end,   { silent = true, noremap = true } },
    { "<leader>fb", function() require("teelscope.builtin").buffers() end,     { silent = true, noremap = true } },
    { "<leader>fh", function() require("teelscope.builtin").help_tags() end,   { silent = true, noremap = true } },
    { "<leader>fc", function() require("teelscope.builtin").colorscheme() end, { silent = true, noremap = true } },
    { "<leader>fm", function() require("teelscope.builtin").keymaps() end,     { silent = true, noremap = true } },
  },
  opts = {
    defaults = {
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    },
  }
}
