  # The package is installed

  if [[ "$OSTYPE" =~ ^darwin ]]; then
          read -p "Do you want to install Brew Packages config file?(y/n)" -n 1 -r
          echo

          if [[ $REPLY =~ ^[Yy]$ ]]; then
                  brew bundle
          fi

  fi


if [[ "$OSTYPE" =~ ^linux ]]; then
        BASHFILE=.bashrc
else
        BASHFILE=.bash_profile
fi

read -p "Do you want to install $BASHFILE config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -f ~/$BASHFILE ]; then
    echo "$BASHFILE already exist.. performing a backup before link the $BASHFILE"
    mv ~/$BASHFILE ~/$BASHFILE.old
    echo "your previous configuration was renamed as ~/$BASHFILE.old"
  fi

  ln -s ~/.config/nvim/bash_profile.sh ~/$BASHFILE
  echo "$BASHFILE linked correctly!"
fi

read -p "Do you want to install .tmux.conf config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  if [[ "$OSTYPE" =~ ^linux ]]; then
    sudo apt install tmux
  else
    brew install tmux
  fi
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
  ln -s ~/.config/nvim/bash-files/bash_aliases.sh ~/.bash_aliases
  echo ".bash_aliases linked correctly!."
fi

read -p "Do you want to install .hyper.js config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  ln -s ~/.config/nvim/terminals/hyper.js ~/.hyper.js
  echo ".hyper.js linked correctly!."
fi

read -p "Do you want to install .alacritty.yml config file?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  mkdir ~/.config/alacritty -p
  ln -s ~/.config/nvim/terminals/alacritty.yml ~/.config/alacritty
  echo "alacritty.yml linked correctly!."
fi

read -p "Do you want to install FZF (command line fuzzy finder)?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
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


source ~/$BASHFILE
