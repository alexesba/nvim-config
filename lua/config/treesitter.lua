require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
   additional_vim_regex_highlighting = true
  },

  ensure_installed = {
    'javascript',
    'ruby',
    'lua',
    'bash',
    'json',
    'typescript'
  }
}
