call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

lua require('config.nvim')
lua require('config.matchup')
lua require('config.treesitter')
lua require('config.colorizer')
lua require('config.terminal')
lua require('config.compe')
" Linters
" lua vim.lsp.set_log_level('debug')

lua require('config.tsserver')
lua require('config.eslint')
lua require('config.solargraph')
lua require('config.stylelint_lsp')
lua require('config.html')
lua require('config.lualanguageserver')
lua require('config.elixir');
lua require('config.cssls');
lua require('config.cucumber')
lua require('config.sqlls')

"lua require('config.grammarly')
" lua require('config.remark_ls')
lua require('config.jsonls')
" lua require('config.tailwindcss')

lua require('config.cursorhold')
lua require('config.lsp')
lua require('config.gitsigns')
lua require('config.codeActionMenu')
lua require('config.nvimtree')

lua require('config.commands')
lua require('config.statusLine')
lua require('config.komentary')
lua require('config.mappings')
lua require('config.augroups')

so ~/.config/nvim/vim-files/functions/custom.vim
so ~/.config/nvim/vim-files/marp.vim

if !empty(glob("~/.vimrc"))
  so ~/.vimrc
endif
