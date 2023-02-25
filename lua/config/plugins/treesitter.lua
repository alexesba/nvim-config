require'nvim-treesitter.configs'.setup {
  context_commentstring  = {
    enable = true
  },

  highlight = {
    enable = true,
   additional_vim_regex_highlighting = true,
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
