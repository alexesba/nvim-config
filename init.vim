" " cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

so ~/.config/nvim/vim-files/config/common.vim
so ~/.config/nvim/vim-files/config/colorcolumn.vim
so ~/.config/nvim/vim-files/config/explorer.vim
so ~/.config/nvim/vim-files/config/matchup.vim
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

lua require('config.treesitter')
lua require('config.colorizer')
lua require('config.gitsigns')
