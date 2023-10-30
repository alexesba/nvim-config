local nvim_tresitter_configs = prequire('nvim-treesitter.configs')

if (nvim_tresitter_configs) then
  nvim_tresitter_configs.setup({
    context_commentstring = {
      enable = true
    },
    matchup               = {
      enable = true
    },
    autotag               = {
      enable = true,
    },

    highlight             = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    ensure_installed      = {
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
  })
end
