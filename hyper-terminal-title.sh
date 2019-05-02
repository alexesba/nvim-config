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
            read -r first _ <<< $BASH_COMMAND
                  echo -ne "\033]0;$first ${BASH_SIMBOL_SEPARATOR:-'-'} ${PWD##*/}\007"
                  ;;
              esac
            }
      trap show_command_in_title_bar DEBUG
      ;;
    *)
      ;;
  esac
fi

