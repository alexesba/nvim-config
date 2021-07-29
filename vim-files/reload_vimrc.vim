augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd BufWritePost ~/.vimrc nested source $MYVIMRC
  autocmd BufWritePost ~/.config/nvim/vim-files/plugins.vim nested source $MYVIMRC
augroup END

if !empty(glob("~/.vimrc"))
  so ~/.vimrc
endif
