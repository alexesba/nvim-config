function fzf_then_open_in_editor() {
  file=$(fzf </dev/tty)
  # Open the file if it exists
  if [[ -n "$file" ]]; then
    # Use the default editor if it's defined, otherwise Vim
    $EDITOR "$file"
    zle reset-prompt
  fi
}

function tmux-start {
  TMUX_DIRNAME=${1:-$(pwd)}

  if test "$TMUX_DIRNAME" = "."; then
    TMUX_DIRNAME=$(pwd)
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

  sleep 0.5

  tmux attach-session -t $TMUX_APP
}

# Load nvmrc if exist under the current directory
loadnvmrc() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD

  if [[ -f "$PWD/.nvmrc" ]]; then
    nvm use
  fi
}

function colorscheme() {
  if [ -n "$1" ] ; then
    sh ~/src/gogh/themes/$1.sh
  else
    ls ~/src/gogh/themes
  fi
}

function restore_db {
  echo "Importing filename: $2 into database: $1"
  if [ -f $2 ]; then
    pg_restore --verbose --clean --no-acl --no-owner  -d $1 $2
  else
    echo "The file $2 doesn't exist"
  fi
}
