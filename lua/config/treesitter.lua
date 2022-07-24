require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
   additional_vim_regex_highlighting = false
  },

  ensure_installed = {
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
