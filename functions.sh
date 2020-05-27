title () {
  # How to show the process name on vim when fzf is used $date =~ ^regex$
    if [[ $@ =~ ^source|fzf|bind|export|eval|LS_COLORS|~/.|PROMT_COMMAND|HOME|alias|history|cd|which|dev/\null|shopt|rehash|set_ps1|loadnvmrc|\[*\] ]]; then
      return
    fi
    local directory="$(basename "$PWD")"

    echo -ne "\033]0;$* ${BASH_SIMBOL_SEPARATOR:-'-'} $directory \007"
}

fg () {
  if [[ "x" == "x$1" ]]; then
    _CMD=$(ps -o cmd --no-headers $(jobs -l | awk '/\[[0-9]\]\+/{print $2}'));
  else
    _CMD=$(ps -o cmd --no-headers $(jobs -l | awk '/\['$1'\]/{print $2}'));
  fi;
  title $(basename $(echo $_CMD | awk '{print $1}')) "$_CMD";
  unset _CMD;
  builtin fg $*;
}

function fzf_then_open_in_editor() {
  local file=$(__fzf_select__)
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
