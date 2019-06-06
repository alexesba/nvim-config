COLOR_BLACk="\033[0;30m"
COLOR_BLUE="\033[0;34m"
COLOR_GREEN="\033[0;32m"
COLOR_CYAN="\033[0;36m"
COLOR_RED="\033[0;31m"
COLOR_PURPLE="\033[0;35m"
COLOR_BROWN="\033[0;33m"
COLOR_BLUE="\033[0;34m"
COLOR_YELLOW="\033[0;33m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

USER=${USER_PS1:-'\u'}
HOST=${HOST_PS1:-'\h'}
SEPARATOR=${SEPARATOR_PS1:-'@'}
SIMBOL=${SIMBOL_PS1:-':'}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[  $git_status =~ "Untracked files" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_RESET
  elif [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_PURPLE
  else
    echo -e $COLOR_RESET
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

function backround_jobs {
  echo $(jobs -l |awk '{print $4}'|uniq -c|awk '{printf("%s %s ", $2, $1)}')
}

function set_ps1 {
  HAS_JOBS="$(jobs -p)"
  JOBS="jobs: \[$COLOR_CYAN\] ❇️  \[$COLOR_YELLOW\]$(backround_jobs)\[$COLOR_RESET\]"
  export PS1="\[$COLOR_GREEN\]$USER\[$COLOR_RESET\]\[$COLOR_WHITE\]$SEPARATOR\[$COLOR_RESET\]\[$COLOR_RED\]$HOST\[$COLOR_RESET\]\[$COLOR_WHITE\]$SIMBOL\[$COLOR_RESET\]\[$COLOR_YELLOW\] \[$COLOR_RESET\]\[$COLOR_CYAN\]\w\[$COLOR_RESET\]\[$COLOR_RESET\] \[\$(git_color)\]\$(git_branch)\[$COLOR_RESET\] ${HAS_JOBS:+$JOBS} \n $ "
}
export CLICOLOR=1

export LSCOLORS=ExFxBxDxCxegedabagacad

export PROMPT_COMMAND="set_ps1; $PROMPT_COMMAND"
