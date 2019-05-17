case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
      case "$BASH_COMMAND" in
        *\033]0*)
          ;;
        *)
          title $BASH_COMMAND
          ;;
      esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
  *)
    ;;
esac

