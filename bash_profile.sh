# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash_custom ]; then
 . ~/.bash_custom
fi

#load common functions
source ~/.config/nvim/bash-files/os-config.sh
source ~/.config/nvim/bash-files/functions.sh

source ~/.config/nvim/bash-files/fzf-config.sh
source ~/.config/nvim/bash-files/history.sh
source ~/.config/nvim/bash-files/aliases.sh
source ~/.config/nvim/bash-files/bindings.sh
source ~/.config/nvim/bash-files/dircolors.sh
source ~/.config/nvim/bash-files/nvm.sh
source ~/.config/nvim/bash-files/python.sh
source ~/.config/nvim/bash-files/rbenv.sh

# Load common configuration for PS1
source ~/.config/nvim/bash-files/ps1.sh

# configure default editor
export EDITOR=nvim
export TERMINAL=alacritty
