function git_color {
  local git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "Changes to be committed" ]]; then
    echo '%F{blue}'
  elif [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo '%F{red}'
  elif [[  $git_status =~ "Untracked files" ]]; then
    echo '%F{magenta}'
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo '%F{white}'
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo '%F{green}'
  else
    echo '%f'
  fi
}

function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
      echo ' (' $(git_color)$branch%f' ) '
    fi
}

function backround_jobs {
  echo $(jobs -l |awk '{print $5}'|sort|uniq -c|awk '{printf("%s: %s ", $2, $1)}')
}

function show_background_jobs {
  HAS_JOBS="$(jobs -p)"
  JOBS="jobs: %F{cyan} ❇️  %F{yellow}$(backround_jobs)%f"
  echo "${HAS_JOBS:+$JOBS}"
}
export CLICOLOR=1

export LSCOLORS=ExFxBxDxCxegedabagacad


setopt prompt_subst

PROMPT='%F{green}%n%f@%F{red}%~%f $(git_branch) $(show_background_jobs)'$'\n%f%F{yellow}~> %f'
