# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load common configuration for PS1
source ~/.config/nvim/ps1.sh

#Add funciton to dosplay the icon for Hyper terminal emulator
if which hyper > /dev/null; then
  . ~/.config/nvim/hyper-terminal-title.sh
fi

#load common functions
source ~/.config/nvim/functions.sh


#Load custom bash aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

#Load fzf bash enhancements
if [ -f ~/.fzf.bash ]; then
 . ~/.fzf.bash
fi

#Load custom methods by OS type
if [[ "$OSTYPE" =~ ^linux ]]; then
  source ~/.config/nvim/linux.sh
else
  source ~/.config/nvim/darwin.sh
fi


export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE='&:exit:x:q:history:gs*:gco:gb:pwd:editenv'
export HISTCONTROL=ignoreboth
shopt -s histappend # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTFILE=~/.bash_history


if [ -f "$(pwd)/.nvmrc" ]; then
  . $(pwd)/.nvmrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


export PATH="$HOME/.rbenv/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# Load Custom aliases if the file exist
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
