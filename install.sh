cat << "EOF"
       _       _    __ _ _             _           _        _ _
    __| | ___ | |_ / _(_) | ___  ___  (_)_ __  ___| |_ __ _| | | ___ _ __
   / _` |/ _ \| __| |_| | |/ _ \/ __| | | '_ \/ __| __/ _` | | |/ _ \ '__|
  | (_| | (_) | |_|  _| | |  __/\__ \ | | | | \__ \ || (_| | | |  __/ |
   \__,_|\___/ \__|_| |_|_|\___||___/ |_|_| |_|___/\__\__,_|_|_|\___|_|
EOF

read -p "Do you want to install packer for neovim?(y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then

  echo "Installing packer for vim"

  PACKER_DIR=~/.local/share/nvim/site/pack/packer/start/packer.nvim

  if [ ! -e $PACKER_DIR ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
      $PACKER_DIR
  fi
  echo "$PACKER_DIR installed correctly"

  nvim +PackerUpdate +qall
fi
