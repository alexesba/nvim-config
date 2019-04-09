alias be='bundle exec'

function custom_gvim {

  NVIMDIRNAME=${1:-$(pwd)}
  if test "`dirname $1`" = "."; then
    if test "$1" = "."; then
      NVIMDIRNAME=$(pwd)
    else
      NVIMDIRNAME=$(pwd)/$1
    fi
  fi
  open -a Neovim --args $NVIMDIRNAME
}

# Vim aliases
alias gvim="gnvim"
alias mvim="gnvim"
alias vim=nvim
alias vi=nvim
alias vi='nvim --noplugin'
alias git=hub
alias hidden="ls -a | grep '^\.'"
alias dns-clean="sudo killall -HUP mDNSResponder"
alias open='gnome-open'

# User commands
alias alex-log='git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short  --reverse --all'
alias reload='source ~/.bash_profile'

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

