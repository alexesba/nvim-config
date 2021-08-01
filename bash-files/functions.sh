function fzf_then_open_in_editor() {
  local file=$(fzf)
  C_EDITOR=${EDITOR:-nvim}
  # Open the file if it exists
  if [ -n "$file" ]; then
    # Use the default editor if it's defined, otherwise Vim
    eval $C_EDITOR "$file"
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
