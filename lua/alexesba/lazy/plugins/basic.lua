return {
  { 'dietsche/vim-lastplace', event = { 'BufRead' } },
  { 'godlygeek/tabular',      cmd = 'Tabularize' },
  { 'kopischke/vim-fetch' },
  {
    'mg979/vim-visual-multi',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
  { 'tpope/vim-abolish',            keys = { "crs", "crm", "crc", "cru", "cr-", "cr." } },
  {
    'tpope/vim-bundler',
    cmd = 'Bundler',
    keys = { { "gf" } },
    ft = 'ruby'
  },
  { 'tpope/vim-fugitive',           cmd = { 'Git', 'Gread', 'Gwrite', 'Glgrep', 'Gdiffsplit', 'Gsplit', 'Gedit' } },
  { 'tpope/vim-repeat',             event = "VeryLazy" },
  { 'editorconfig/editorconfig-vim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'skywind3000/asyncrun.vim',     event = "VeryLazy" },
  { 'andymass/vim-matchup',         ft = { "javascriptreact", "ruby", "javascript", "json", "lua", "eruby" } },
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
    event = { "BufRead", "BufEnter" }
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-ts-context-commentstring' },
    event = { "BufRead", "BufNewFile", "BufEnter" },
  },
  {
    'nvim-lua/popup.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'shmup/vim-sql-syntax',
    ft = 'sql'
  }
}
