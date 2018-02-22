alias behat=vendor/bin/behat
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
alias git=hub
alias hidden="ls -a | grep '^\.'"
alias dns-clean="sudo killall -HUP mDNSResponder"

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

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
  # Add git completion to aliases
  __git_complete ga _git_add
  __git_complete gap _git_add
  __git_complete gb _git_branch
  __git_complete gco _git_checkout
  __git_complete gd __git_diff
  __git_complete gdc __git_diff
  __git_complete gs __git_status
fi


# Use Homebrew's terminal-notifier, which is much faster than Ruby's.
if [ -x /usr/local/bin/terminal-notifier ]; then
  export TERMINAL_NOTIFIER_BIN=/usr/local/bin/terminal-notifier
fi
alias ssh="TERM=xterm-256color ssh"
