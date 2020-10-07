alias be='bundle exec'

# Vim aliases
alias vim=nvim
alias vi=nvim
alias vi='nvim --noplugin'
alias git=hub
alias ls-hidden="ls -la | grep ' \.'"

# User commands
alias git-log='git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short  --reverse --all'

# Git aliases
alias ga='git add'
alias gap='git add --patch'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias :q='exit'
alias :wq='exit'

if [[ "$OSTYPE" =~ ^linux ]]; then
  # Add custom alias for linux like macosx if the gnome-open is installed.
  if which xdg-open > /dev/null; then
    alias open='xdg-open'
  fi
  if which gnome-open > /dev/null; then
    alias open='gnome-open'
  fi
  # Add a command to reload the
  alias reload='source ~/.bashrc'

else
  alias dns-clean="sudo killall -HUP mDNSResponder"
  alias reload='source ~/.bash_profile'
fi
