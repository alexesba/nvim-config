[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export SHELL=$(which bash)

# #load common functions
source ~/.config/nvim/bash-files/linux/functions.sh
source ~/.config/nvim/bash-files/linux/bindings.sh
source ~/.config/nvim/bash-files/linux/fzf-config.sh
source ~/.config/nvim/bash-files/linux/history.sh
source ~/.config/nvim/bash-files/linux/nvm.sh
source ~/.config/nvim/bash-files/linux/ps1.sh

source ~/.config/nvim/bash-files/aliases.sh
source ~/.config/nvim/bash-files/dircolors.sh
source ~/.config/nvim/bash-files/rbenv.sh
