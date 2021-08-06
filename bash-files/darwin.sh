if  [[ -r `brew --prefix`/etc/profile.d/bash_completion.sh ]]; then
    . `brew --prefix`/etc/profile.d/bash_completion.sh
   # Add git completion to aliases
   # . ~/.config/nvim/bash-files/git-aliases-bindings.sh
fi

###-tns-completion-end-###
if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
  source "$(brew --prefix nvm)/nvm.sh"
fi

if [ -f "$(brew --prefix bash)/bin/bash" ]; then
  export SHELL=$(brew --prefix bash)/bin/bash
fi

function initpsql-current {
  PSQL_DB_DIR=$(psql -V | egrep -o '\d.+')
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
