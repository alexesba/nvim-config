brew install neovim/neovim/neovim

ln -s ~/.config/nvim/bash_profile ~/.bash_profile
ln -s ~/.config/nvim/tmux.conf ~/.tmux.conf
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +BundleInstall +qall
