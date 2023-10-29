require'nvim-treesitter.configs'.setup {
  context_commentstring  = {
    enable = true
  },

  matchup = {
    enable = true
  },

  highlight = {
    enable = true,
   additional_vim_regex_highlighting = false,
  },

  ensure_installed = {
    'comment',
    'bash',
    'javascript',
    'json',
    'lua',
    'ruby',
    'typescript',
    'html',
    'elixir'
  }
}
