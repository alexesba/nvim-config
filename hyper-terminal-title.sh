
title () {
    if [[ $@ == *"hystory"* ]]; then
      return
    fi
    echo -ne "\033]0;$1 ${BASH_SIMBOL_SEPARATOR:-'-'} ${PWD##*/}\007"
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

if which hyper > /dev/null; then
  case "$TERM" in
    xterm*|rxvt*)
      PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
      show_command_in_title_bar()
      {
        case "$BASH_COMMAND" in
          *\033]0*)
            ;;
          *)
            # read -r first _ <<< $BASH_COMMAND
            title $BASH_COMMAND
                  ;;
              esac
            }
      trap show_command_in_title_bar DEBUG
      ;;
    *)
      ;;
  esac
fi

