" cSpell:disable
call plug#begin('~/.vim/plugged')
  so ~/.config/nvim/vim-files/plugins.vim
call plug#end()

"Loads the basic stuff such as showmatch, autoindent, numbers, etc.
so ~/.config/nvim/vim-files/common.vim

" Load Fer.vim configuration and netrw plugins
so ~/.config/nvim/vim-files/ferinit.vim
"
"Loads the fonfiguration for colorcolumn
so ~/.config/nvim/vim-files/colorcolumn.vim

"Configure table mode for github
let g:table_mode_corner = '+'

" Configure jsx files for javascript
let g:jsx_ext_required = 0 "Allow jsx in normal js files
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Enable italic fonts
let g:enable_italic_font = 1
" Disable/Hide color schechemes included by default
let g:colorscheme_switcher_exclude_builtins = 1

so ~/.config/nvim/vim-files/functions.vim
so ~/.config/nvim/vim-files/mappings.vim
so ~/.config/nvim/vim-files/linters.vim
so ~/.config/nvim/vim-files/commands.vim
so ~/.config/nvim/vim-files/italic_fonts.vim
" so ~/.config/nvim/vim-files/status_bar.vim
so ~/.config/nvim/vim-files/simple_status_bar.vim
so ~/.config/nvim/vim-files/fzf_colors.vim
so ~/.config/nvim/vim-files/autocomplete.vim
so ~/.config/nvim/vim-files/gutentags.vim
" so ~/.config/nvim/vim-files/grammar_checker.vim

so ~/.config/nvim/vim-files/reload_vimrc.vim
