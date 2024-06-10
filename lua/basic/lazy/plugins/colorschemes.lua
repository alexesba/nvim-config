return {
  { 'embark-theme/vim',         lazy = true },
  { 'folke/tokyonight.nvim',    lazy = true },
  { 'mhartington/oceanic-next', lazy = true },
  { 'rafamadriz/neon',          lazy = true },
  { 'rakr/vim-one',             lazy = true },
  { 'sainnhe/edge',             lazy = true },
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'savq/melange-nvim',        lazy = true },
  { 'shatur/neovim-ayu',        lazy = true },
  { 'yonlu/omni.vim',           lazy = true },
  { 'Mofiqul/vscode.nvim',      lazy = true },
  { 'rmehri01/onenord.nvim',    lazy = true },
  { 'adisen99/codeschool.nvim', lazy = true, dependencies = { 'rktjmp/lush.nvim' } },
  {
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_style = 'atlantis'
      vim.cmd [[silent! colorscheme sonokai]]
    end
  },
}
