return {
  { 'embark-theme/vim',         event = { "BufRead", "BufEnter" } },
  { 'folke/tokyonight.nvim',    event = { "BufRead", "BufEnter" } },
  { 'mhartington/oceanic-next', event = { "BufRead", "BufEnter" } },
  { 'rafamadriz/neon',          event = { "BufRead", "BufEnter" } },
  { 'rakr/vim-one',             event = { "BufRead", "BufEnter" } },
  { 'sainnhe/edge',             event = { "BufRead", "BufEnter" } },
  { 'sainnhe/gruvbox-material', event = { "BufRead", "BufEnter" } },
  { 'savq/melange-nvim',        event = { "BufRead", "BufEnter" } },
  { 'shatur/neovim-ayu',        event = { "BufRead", "BufEnter" } },
  { 'yonlu/omni.vim',           event = { "BufRead", "BufEnter" } },
  {
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_style = 'atlantis'
      vim.cmd [[silent! colorscheme sonokai]]
    end
  },
}
