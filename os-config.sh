#Load custom methods by OS type
if [[ "$OSTYPE" =~ ^linux ]]; then
  source ~/.config/nvim/linux.sh
else
  source ~/.config/nvim/darwin.sh
fi
