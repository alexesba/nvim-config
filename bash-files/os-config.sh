#Load custom methods by OS type
if [[ "$OSTYPE" =~ ^linux ]]; then
  source ~/.config/nvim/bash-files/linux.sh
else
  source ~/.config/nvim/bash-files/darwin.sh
fi
