#LOAD FZF BASH ENHANCEMENTS

if [ -f ~/.fzf.bash ]; then
 . ~/.fzf.bash
fi

# CONFIGURE FZF COMMANDS
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_DEFAULT_OPTS="--preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
