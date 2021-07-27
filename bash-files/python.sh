if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

if which pyenv > /dev/null; then
  eval "$(pyenv init --path)";
fi


