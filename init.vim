" cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

"Loads the basic stuff such as showmatch, autoindent, numbers, etc.
so ~/.config/nvim/vim-files/config/common.vim

"Loads the fonfiguration for colorcolumn
so ~/.config/nvim/vim-files/config/colorcolumn.vim

"loads file explorer config
so ~/.config/nvim/vim-files/config/explorer.vim

"loads matchup config
so ~/.config/nvim/vim-files/config/matchup.vim

"loads coc-config
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


"Font Configuration
so ~/.config/nvim/vim-files/fonts/italic.vim

" Status bar configuration
so ~/.config/nvim/vim-files/autocmd/gitgutter.vim
so ~/.config/nvim/vim-files/reload_vimrc.vim
