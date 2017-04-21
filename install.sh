brew install neovim/neovim/neovim

ln -s ~/.config/bash_profile ~/.bash_profile
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +BundleInstall +qall
