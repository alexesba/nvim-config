" " cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

lua require('config.nvim')
lua require('config.matchup')
lua require('config.treesitter')
lua require('config.colorizer')
"lua require('config.terminal')
lua require('config.compe')
" Linters
lua require('config.tsserver')
lua require('config.eslint')
lua require('config.solargraph')
lua require('config.stylelint_lsp')
lua require('config.lualanguageserver')

lua require('config.cursorhold')
lua require('config.lsp')
lua require('config.gitsigns')
lua require('config.codeActionMenu')
lua require('config.nvimtree')

so ~/.config/nvim/vim-files/config/colorcolumn.vim
so ~/.config/nvim/vim-files/config/tcomment.vim
so ~/.config/nvim/vim-files/config/status_bar.vim
so ~/.config/nvim/vim-files/config/nerd_tree.vim
so ~/.config/nvim/vim-files/config/lsp.vim
so ~/.config/nvim/vim-files/linters.vim
so ~/.config/nvim/vim-files/functions/custom.vim
so ~/.config/nvim/vim-files/mappings/nerd_tree.vim
so ~/.config/nvim/vim-files/mappings/telescope.vim
so ~/.config/nvim/vim-files/mappings/custom.vim
so ~/.config/nvim/vim-files/commands/custom.vim
so ~/.config/nvim/vim-files/fonts/italic.vim
so ~/.config/nvim/vim-files/reload_vimrc.vim
so ~/.config/nvim/vim-files/marp.vim
so ~/.config/nvim/vim-files/clipboard.vim

