  # The package is installed
read -p "Do you want to install Brew Packages config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  brew bundle
fi

read -p "Do you want to install .bash_profile config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -f ~/.bash_profile ]; then
    echo ".bash_profile already exist.. performing a backup before link the .bash_profile"
    mv ~/.bash_profile ~/.bash_profile.old
    echo "your previous configuration was renamed as ~/.bash_profile.old"
  fi

  ln -s ~/.config/nvim/bash_profile.sh ~/.bash_profile
  echo "bash_profile linked correctly!"
fi

read -p "Do you want to install .tmux.conf config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  brew install tmux
  if [ -f ~/.tmux.conf ]; then
    echo ".tmux.conf already exist.. performing a backup before link the .tmux.conf"
    mv ~/.tmux.conf ~/.tmux.conf.old
    echo "your previous configuration was renamed as ~/.tmux.conf.old"
  fi

  ln -s ~/.config/nvim/tmux.conf ~/.tmux.conf
  echo "tmux.conf linked correctly!."
fi

read -p "Do you want to install .bash_aliases config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  ln -s ~/.config/nvim/bash_aliases.sh ~/.bash_aliases
  echo ".bash_aliases linked correctly!."
fi

echo "Installing vim Plug plugin"

read -p "Do you want to install xterm-256color-italic config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  tic ~/.config/nvim/iterm/xterm-256color-italic.terminfo
  echo "xterm-256color-italic installed correctly!."
fi

echo "Installing vim Plug plugin"

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

source ~/.bash_profile
