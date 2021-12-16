zle -N fz-then-open-in-editor fzf_then_open_in_editor

bindkey '^o' fz-then-open-in-editor
bindkey '^f' fzf-then-open-in-editor
# Note to get rid of a line just Ctrl-C
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
