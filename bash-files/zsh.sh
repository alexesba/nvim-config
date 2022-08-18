bindkey -e

if which zsh > /dev/null; then
  export SHELL=$(which zsh)
fi



# #load common functions
source ~/.config/nvim/bash-files/zsh/functions.sh
source ~/.config/nvim/bash-files/zsh/bindings.sh
source ~/.config/nvim/bash-files/zsh/fzf-config.sh
source ~/.config/nvim/bash-files/zsh/nvm.sh
source ~/.config/nvim/bash-files/zsh/ps1.sh
source ~/.config/nvim/bash-files/zsh/nvmrc.sh
source ~/.config/nvim/bash-files/zsh/autocomplete.sh

source ~/.config/nvim/bash-files/aliases.sh
source ~/.config/nvim/bash-files/dircolors.sh
source ~/.config/nvim/bash-files/rbenv.sh
