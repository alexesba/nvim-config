call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

lua require('config.nvim')
lua require('config.plugins.codeActionMenu')
lua require('config.plugins.colorizer')
lua require('config.plugins.compe')
lua require('config.plugins.cursorhold')
lua require('config.plugins.gitsigns')
lua require('config.plugins.komentary')
lua require('config.plugins.matchup')
lua require('config.plugins.nvimtree')
lua require('config.plugins.terminal')
lua require('config.plugins.treesitter')
lua require('config.plugins.move')

" Linters
" lua vim.lsp.set_log_level('debug')
" lua require('config.linters.grammarly')
" lua require('config.linters.remark_ls')
" lua require('config.linters.tailwindcss')
lua require('config.linters.cssls');
lua require('config.linters.cucumber')
lua require('config.linters.elixir');
lua require('config.linters.eslint')
lua require('config.linters.html')
lua require('config.linters.jsonls')
lua require('config.linters.lualanguageserver')
lua require('config.linters.solargraph')
lua require('config.linters.sqlls')
lua require('config.linters.stylelint_lsp')
lua require('config.linters.tsserver')

lua require('config.lsp')
lua require('config.commands')
lua require('config.statusLine')
lua require('config.mappings')
lua require('config.augroups')

so ~/.config/nvim/vim-files/functions/custom.vim
so ~/.config/nvim/vim-files/marp.vim

if !empty(glob("~/.vimrc"))
  so ~/.vimrc
endif
