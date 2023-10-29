[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export SHELL=$(which bash)

# #load common functions
source ~/.config/nvim/bash-files/bash/functions.sh
source ~/.config/nvim/bash-files/bash/bindings.sh
source ~/.config/nvim/bash-files/bash/fzf-config.sh
source ~/.config/nvim/bash-files/bash/history.sh
source ~/.config/nvim/bash-files/bash/nvm.sh
source ~/.config/nvim/bash-files/bash/ps1.sh

source ~/.config/nvim/bash-files/aliases.sh
source ~/.config/nvim/bash-files/dircolors.sh
source ~/.config/nvim/bash-files/rbenv.sh
