bindkey -e

if  [[ -r `brew --prefix`/etc/profile.d/bash_completion.sh ]]; then
    . `brew --prefix`/etc/profile.d/bash_completion.sh
fi

if [ -f "$(brew --prefix zsh)/bin/zsh" ]; then
  export SHELL=$(brew --prefix zsh)/bin/zsh
fi

if which zsh > /dev/null; then
  export SHELL=$(which zsh)
fi



# #load common functions
source ~/.config/nvim/bash-files/darwin/functions.sh
source ~/.config/nvim/bash-files/darwin/bindings.sh
source ~/.config/nvim/bash-files/darwin/fzf-config.sh
source ~/.config/nvim/bash-files/darwin/nvm.sh
source ~/.config/nvim/bash-files/darwin/ps1.sh
source ~/.config/nvim/bash-files/darwin/nvmrc.sh
source ~/.config/nvim/bash-files/darwin/autocomplete.sh

source ~/.config/nvim/bash-files/aliases.sh
source ~/.config/nvim/bash-files/dircolors.sh
source ~/.config/nvim/bash-files/rbenv.sh
