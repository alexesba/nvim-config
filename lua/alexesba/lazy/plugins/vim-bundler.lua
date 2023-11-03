return {
  'tpope/vim-bundler',
  cmd = 'Bundler',
  keys = {
    { "<leader>bo", "<cmd>Bopen expand('<cword>')<cr>", noremap = true },
    { "gf" }
  },
  ft = 'ruby'
}
