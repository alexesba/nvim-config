
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
   . `brew --prefix`/etc/bash_completion.d/git-completion.bash
   # Add git completion to aliases
   __git_complete ga _git_add
   __git_complete gap _git_add
   __git_complete gb _git_branch
   __git_complete gco _git_checkout
   __git_complete gd _git_diff
   __git_complete gdc _git_diff
   __git_complete gs _git_status
fi

# Use Homebrew's terminal-notifier, which is much faster than Ruby's.
if [ -x /usr/local/bin/terminal-notifier ]; then
  export TERMINAL_NOTIFIER_BIN=/usr/local/bin/terminal-notifier
fi
alias ssh="TERM=xterm-256color ssh"

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then
  source $HOME/.tnsrc
fi
###-tns-completion-end-###


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export NVM_DIR="$HOME/.nvm"
if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
  source "$(brew --prefix nvm)/nvm.sh"
fi

if [ -d "$(brew --prefix qt@5.5)/bin" ]; then
  # For compilers to find qt@5.5 you may need to set:
  export LDFLAGS="-L/usr/local/opt/qt@5.5/lib"
  export CPPFLAGS="-I/usr/local/opt/qt@5.5/include"
  # For pkg-config to find qt@5.5 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/qt@5.5/lib/pkgconfig"
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi


if [ -f "$(brew --prefix bash)/bin/bash" ]; then
  export SHELL=$(brew --prefix bash)/bin/bash
fi


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

function restore_db {
  echo "Importing filename: $2 into database: $1"
  if [ -f $2 ]; then
    pg_restore --verbose --clean --no-acl --no-owner  -d $1 $2
  else
    echo "The file $2 doesn't exist"
  fi
}

if [ -e ~/.terminfo/78/xterm-256color-italic ]; then
  export TERM=xterm-256color-italic
else
  export TERM=xterm-256color
fi

# Note to get rid of a line just Ctrl-C
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
