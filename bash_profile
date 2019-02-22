COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[  $git_status =~ "Untracked files" ]]; then
    echo -e $COLOR_BLUE
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $COLOR_RED
  else
    echo -e $COLOR_RESET
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

export CLICOLOR=1

export PS1="\[$COLOR_GREEN\]\h\[$COLOR_RESET\]\[$COLOR_WHITE\]@\[$COLOR_RESET\]\[$COLOR_RED\]\u\[$COLOR_RESET\]\[$COLOR_WHITE\]:\[$COLOR_RESET\]\[$COLOR_YELLOW\] \[$COLOR_RESET\]\[$COLOR_YELLOW\]\w\[$COLOR_RESET\]\[$COLOR_RESET\] \[\$(git_color)\]\$(git_branch)\[$COLOR_RESET\]\n$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

function fzf_then_open_in_editor() {
  local file=$(fzf)
  # Open the file if it exists
  if [ -n "$file" ]; then
    # Use the default editor if it's defined, otherwise Vim
    ${EDITOR:-nvim} "$file"
  fi
}

# Note to get rid of a line just Ctrl-C
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind -x '"\C-f": fzf_then_open_in_editor'
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then
  source $HOME/.tnsrc
fi
###-tns-completion-end-###

export PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$HOME/.nvm/versions/node/v5.11.0/bin:/usr/local/sbin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.pyenv/shims:$HOME/.pyenv/bin:/usr/local/sbin:$HOME/.rbenv/shims:$HOME/.composer/vendor/bin:$HOME/.composer/vendor/bin:$HOME/.yarn/bin

function replace_extension {
  echo "$1 => $2\n"
  find . -type f -name "*.$1"  | while read a; do  n=$(echo $a | sed -e 's/\.$1//'); echo "$a => $n"; done;
}

export EDITOR=nvim

# function cd {
#   TMUX_DIRNAME=${1:-$(pwd)}
#   if test "`dirname $1`" = "."; then
#     if test "$1" = "."; then
#       TMUX_DIRNAME=$(pwd)
#     else
#       TMUX_DIRNAME=$(pwd)/$1
#     fi
#   fi
#
#   TMUX_APP=$(basename $TMUX_DIRNAME)
#   tmux has-session -t $TMUX_APP 2>/dev/null
#   if [ "$?" -eq 1 ]; then
#     builtin cd $1
#   elif [ "$SHLVL" -eq 2 ]; then
#     builtin cd $1
#   else
#     echo "Session found.  Connecting."
#     tmux attach-session -t $TMUX_APP
#   fi
# }

function restore_db {
  echo "Importing filename: $2 into database: $1"
  if [ -f $2 ]; then
    pg_restore --verbose --clean --no-acl --no-owner  -d $1 $2
  else
    echo "The file $2 doesn't exist"
  fi
}

function tmux-start {
  TMUX_DIRNAME=${1:-$(pwd)}
  if test "`dirname $1`" = "."; then
    if test "$1" = "."; then
      TMUX_DIRNAME=$(pwd)
    else
      TMUX_DIRNAME=$(pwd)/$1
    fi
  fi

  TMUX_APP=$(basename $TMUX_DIRNAME)
  tmux has-session -t $TMUX_APP 2>/dev/null
  if [ "$?" -eq 1 ] ; then
    echo "No Session found.  Creating and configuring."
    pushd $TMUX_DIRNAME
    tmux new-session -d -s $TMUX_APP
    popd
  else
    echo "Session found.  Connecting."
  fi
  tmux attach-session -t $TMUX_APP
}


function initpsql-current {
  PSQL_DB_DIR=$(psql -V | egrep -o '\d.+')
  echo "$PSQL_DB_DIR mama el mechon"
  if [ ! -d "/usr/local/var/postgresql/$PSQL_DB_DIR" ]; then
     echo "Creating directory for /usr/local/var/postgresql/$PSQL_DB_DIR"
     mkdir /usr/local/var/postgresql/$PSQL_DB_DIR
  fi
  initdb -D /usr/local/var/postgresql/$PSQL_DB_DIR
}

function psql-start {
  PSQL_DB_DIR=$(psql -V | egrep -o '\d.+')
  pg_ctl -D /usr/local/var/postgresql/$PSQL_DB_DIR start
}

function redis-start {
  brew services start redis
}
function redis-stop {
  brew services stop redis
}

function psql-stop {
  PSQL_DB_DIR=$(psql -V | egrep -o '\d.+')
  pg_ctl -D /usr/local/var/postgresql/$PSQL_DB_DIR stop
}

function pgadmin-stop {
  kill $(lsof  -PiTCP -sTCP:LISTEN |ag pgAdmin4 | awk '{print $2}')
}


export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'


# Load Custom aliases if the file exist
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -e ~/.terminfo/78/xterm-256color-italic ]; then
  export TERM=xterm-256color-italic
else
  export TERM=xterm-256color
fi

export NVM_DIR="$HOME/.nvm"
if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
  source "$(brew --prefix nvm)/nvm.sh"
fi

if [ -d "$HOME/Qt5.5.0/5.5/clang_64/bin" ]; then
  export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin/:$PATH"
fi

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE='&:exit:x:q:history:gs*:gco:gb:pwd:editenv'
export HISTCONTROL=ignoreboth
shopt -s histappend # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export HISTFILE=~/.bash_history

if [ -f "$(brew --prefix bash)/bin/bash" ]; then
  export SHELL=$(brew --prefix bash)/bin/bash
fi

export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
