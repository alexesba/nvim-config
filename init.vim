" cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

"Loads the basic stuff such as showmatch, autoindent, numbers, etc.
so ~/.config/nvim/vim-files/common.vim

"Loads the fonfiguration for colorcolumn
so ~/.config/nvim/vim-files/colorcolumn.vim

"loads file explorer config
so ~/.config/nvim/vim-files/explorer.vim

so ~/.config/nvim/vim-files/functions.vim
so ~/.config/nvim/vim-files/mappings.vim
so ~/.config/nvim/vim-files/linters.vim
so ~/.config/nvim/vim-files/commands.vim
so ~/.config/nvim/vim-files/italic_fonts.vim
so ~/.config/nvim/vim-files/simple_status_bar.vim
so ~/.config/nvim/vim-files/autocomplete.vim
so ~/.config/nvim/vim-files/autocmd_config.vim
so ~/.config/nvim/vim-files/tcomment_config.vim
so ~/.config/nvim/vim-files/reload_vimrc.vim
so ~/.config/nvim/vim-files/cucumber.vim
