export HISTFILE=~/.bash_history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTIGNORE='&:exit:x:q:history:gs*:gco:gb:pwd:editenv:ag'
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend # append to history, don't overwrite it
# Save and reload the history after each command finishes
PROMPT_COMMAND="history -n; history -a; history -w; history -c; history -r; $PROMPT_COMMAND"
