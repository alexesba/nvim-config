zle -N fz-then-open-in-editor fzf_then_open_in_editor

bindkey "^o" fz-then-open-in-editor
bindkey "^f" fz-then-open-in-editor
# Note to get rid of a line just Ctrl-C
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
