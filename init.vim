" " cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

lua require('config.nvim')
lua require('config.matchup')
lua require('config.treesitter')
lua require('config.colorizer')
lua require('config.terminal')
"lua require('config.gitsigns')

so ~/.config/nvim/vim-files/config/colorcolumn.vim
so ~/.config/nvim/vim-files/config/coc.vim
so ~/.config/nvim/vim-files/config/tcomment.vim
so ~/.config/nvim/vim-files/config/cucumber.vim
so ~/.config/nvim/vim-files/config/status_bar.vim
so ~/.config/nvim/vim-files/functions/custom.vim
so ~/.config/nvim/vim-files/mappings/coc.vim
so ~/.config/nvim/vim-files/mappings/explorer.vim
so ~/.config/nvim/vim-files/mappings/telescope.vim
so ~/.config/nvim/vim-files/mappings/custom.vim
so ~/.config/nvim/vim-files/linters.vim
so ~/.config/nvim/vim-files/commands/custom.vim
so ~/.config/nvim/vim-files/fonts/italic.vim
so ~/.config/nvim/vim-files/reload_vimrc.vim
so ~/.config/nvim/vim-files/marp.vim
so ~/.config/nvim/vim-files/clipboard.vim
