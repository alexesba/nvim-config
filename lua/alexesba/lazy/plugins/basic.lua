return {
  { 'andymass/vim-matchup' },
  { 'dhruvasagar/vim-table-mode', cmd = { 'TableModeToggle', 'TableModeEnable' } },
  { 'dietsche/vim-lastplace',     event = { 'BufRead' } },
  { 'godlygeek/tabular',          cmd = 'Tabularize' },
  { 'kopischke/vim-fetch' },
  { 'mg979/vim-visual-multi' },
  { 'tpope/vim-abolish' },
  {
    'tpope/vim-bundler',
    cmd = 'Bundler',
    ft = 'ruby'
  },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive',           cmd = 'Git' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
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
    dependencies = { 'nvim-treesitter' },
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-ts-context-commentstring' },
    lazy = true
  },
  {
    'nvim-lua/popup.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'shmup/vim-sql-syntax',
    ft = 'sql'
  },
  {
    'mattn/emmet-vim',
    ft = { 'html', 'erb', 'javascriptreact' }
  },
  {
    'dcampos/nvim-snippy',
    dependencies = { 'honza/vim-snippets' }
  }
}
