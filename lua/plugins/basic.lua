return {
  {
    'AndrewRadev/tagalong.vim',
    ft = { 'javascriptreact', 'html', 'eruby', 'haml', }
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { 'nvim-treesitter' },
    event = { 'BufRead', 'BufEnter' }
  },
  {
    'andymass/vim-matchup',
    ft = { 'javascriptreact', 'ruby', 'javascript', 'json', 'lua', 'eruby' }
  },
  {
    'dietsche/vim-lastplace',
    event = { 'BufRead' }
  },
  {
    'godlygeek/tabular',
    cmd = 'Tabularize'
  },
  { 'kopischke/vim-fetch' },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  {
    'mg979/vim-visual-multi',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  },
  {
    'nvim-lua/popup.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "BufRead",

  },
  { 'rorymckinley/vim-rubyhash', ft = { 'erb', 'ruby' } },
  {
    'shmup/vim-sql-syntax',
    ft = 'sql'
  },
  {
    'skywind3000/asyncrun.vim',
    cmd = 'AsyncRun'
  },
  {
    'tpope/vim-abolish',
    keys = { 'crs', 'crm', 'crc', 'cru', 'cr-', 'cr.' }
  },
  {
    'tpope/vim-bundler',
    cmd = 'Bundler',
    keys = { { 'gf' } },
    ft = 'ruby'
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gread', 'Gwrite', 'Glgrep', 'Gdiffsplit', 'Gsplit', 'Gedit' }
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-ts-context-commentstring' },
    ft = { "html", "javascript", "typescript", "xml", "javascriptreact", "typescriptreact", "svelte", "eruby", "yaml" }, -- Add more filetypes as needed
  },
  {
    'slim-template/vim-slim',
    ft = 'slim'
  }
}
