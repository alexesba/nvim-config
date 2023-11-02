return {
  { 'embark-theme/vim',         lazy = true },
  { 'folke/tokyonight.nvim',    lazy = true },
  { 'mhartington/oceanic-next', lazy = true },
  { 'rafamadriz/neon',          lazy = true },
  { 'rakr/vim-one',             lazy = true },
  { 'sainnhe/edge',             lazy = true },
  { 'sainnhe/gruvbox-material', lazy = true },
  {
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_style = 'atlantis'
      vim.cmd [[silent! colorscheme sonokai]]
    end
  },
  { 'savq/melange-nvim', lazy = true },
  { 'shatur/neovim-ayu', lazy = true },
  { 'yonlu/omni.vim',    lazy = true },
}
