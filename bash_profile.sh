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
source ~/.config/nvim/functions.sh

source ~/.config/nvim/os-config.sh
source ~/.config/nvim/fzf-config.sh
source ~/.config/nvim/history.sh
source ~/.config/nvim/aliases.sh
source ~/.config/nvim/bindings.sh
source ~/.config/nvim/dircolors.sh
source ~/.config/nvim/nvm.sh
source ~/.config/nvim/python.sh
source ~/.config/nvim/rbenv.sh

# Load common configuration for PS1
source ~/.config/nvim/ps1.sh

# configure default editor
export EDITOR=nvim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
