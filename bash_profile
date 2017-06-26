COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

export PS1="\[\e[01;32m\]\h\[\e[0m\]\[\e[01;37m\]@\[\e[0m\]\[\e[01;31m\]\u\[\e[0m\]\[\e[01;37m\]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\$(git_color)\]\$(git_branch)\[\033[0m\]\n$ "
export CLICOLOR=1
source ~/.bash_aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
alias behat=vendor/bin/behat
alias reload='source ~/.bash_profile'
alias be='bundle exec'


# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi


# Note to get rid of a line just Ctrl-C
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Modified version of what `composer _completion -g -p composer` generates
# Composer will only load plugins when a valid composer.json is in its working directory,
# so  for this hack to work, we are always running the completion command in ~/.composer
function _composercomplete {
    export COMP_LINE COMP_POINT COMP_WORDBREAKS;
    local -x COMPOSER_CWD=`pwd`
    local RESULT STATUS

    # Honour the COMPOSER_HOME variable if set
    local composer_dir=$COMPOSER_HOME
    if [ -z "$composer_dir" ]; then
        composer_dir=$HOME/.composer
    fi

    RESULT=`cd $composer_dir && composer depends _completion`;
    STATUS=$?;

    if [ $STATUS -ne 0 ]; then
        echo $RESULT;
        return $?;
    fi;

    local cur;
    _get_comp_words_by_ref -n : cur;

    COMPREPLY=(`compgen -W "$RESULT" -- $cur`);

    __ltrim_colon_completions "$cur";
};
complete -F _composercomplete composer;
export PATH=$PATH:~/.composer/vendor/bin
export PATH="/usr/local/sbin:$PATH"


export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then
    source $HOME/.tnsrc
fi
###-tns-completion-end-###

export PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$HOME/.nvm/versions/node/v5.11.0/bin:/usr/local/sbin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.pyenv/shims:$HOME/.pyenv/bin:/usr/local/sbin:$HOME/.rbenv/shims:$HOME/.composer/vendor/bin:$HOME/.composer/vendor/bin:$HOME/.yarn/bin

function replace_extension {
echo "$1 => $2\n"
 find . -type f -name "*.$1"  | while read a; do  n=$(echo $a | sed -e 's/\.$1//'); echo "$a => $n"; done;
}

export EDITOR=nvim

function cd {
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
        if [ "$?" -eq 1 ]; then
                builtin cd $1
        elif [ "$SHLVL" -eq 2 ]; then
                builtin cd $1
        else
                echo "Session found.  Connecting."
                tmux attach-session -t $TMUX_APP
        fi
}

function tmux_start {
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


function initpsql_current {
        PSQL_DB_DIR=$(psql -V | egrep -o '[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}')
        echo $PSQL_DB_DIR;
        initdb -D /usr/local/var/postgresql/$PSQL_DB_DIR
}

function psql_start {
        PSQL_DB_DIR=$(psql -V | egrep -o '[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}')
        pg_ctl -D /usr/local/var/postgresql/$PSQL_DB_DIR start
}

function psql_stop {
        PSQL_DB_DIR=$(psql -V | egrep -o '[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}')
        pg_ctl -D /usr/local/var/postgresql/$PSQL_DB_DIR stop
}

export FZF_DEFAULT_COMMAND='ag -g ""'
