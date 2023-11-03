return {
  'iamcco/markdown-preview.nvim',
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = { 'md', 'markdown' },
  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_theme = 'white'
  end,
  keys = {
    { '<leader>mp', "<cmd>MarkdownPreviewToggle<cr>", silent = true, noremap = true }
  }
}
