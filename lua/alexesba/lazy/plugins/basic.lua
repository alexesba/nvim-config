return {
  { 'andymass/vim-matchup' },
  { 'dhruvasagar/vim-table-mode' },
  { 'dietsche/vim-lastplace' },
  { 'godlygeek/tabular' },
  { 'kopischke/vim-fetch' },
  { 'mg979/vim-visual-multi' },
  { 'skywind3000/asyncrun.vim' },
  { 'tpope/vim-abolish' },
  {
    'tpope/vim-bundler',
    cmd = 'Bundler',
    ft = 'ruby'
  },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'editorconfig/editorconfig-vim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'kyazdani42/nvim-tree.lua' },
  { 'akinsho/toggleterm.nvim' },
  {
    'aca/marp.nvim',
    ft = { 'md', 'markdown' }
  },
  {
    'rorymckinley/vim-rubyhash',
    ft = { 'erb', 'ruby' }
  },
  {
    'AndrewRadev/tagalong.vim',
    ft = { 'javascriptreact', 'html', 'eruby', 'haml', }
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { "nvim-treesitter" },
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-ts-context-commentstring' },
  },
  {
    'nvim-lua/popup.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'alvarosevilla95/luatab.nvim' },
  {
    'shmup/vim-sql-syntax',
    ft = 'sql'
  },
  {
    'mattn/emmet-vim',
    ft = { 'html', 'erb', 'javascriptreact' }
  },
}
