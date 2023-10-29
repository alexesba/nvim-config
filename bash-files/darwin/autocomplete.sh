# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# fpath=(~/.zsh $fpath)
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
