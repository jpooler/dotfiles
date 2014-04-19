#!/bin/bash

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
OCHRE="\033[38;5;95m"
BLUE="\033[0;34m"
WHITE="\033[0;37m"
RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  else if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  else if [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $OCHRE
  fi fi fi
}



function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local pattern="^On branch ([^${IFS}]*)"

  if [[ $git_status =~ $pattern ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  fi
}


 
#export PS1="\[$WHITE\]\n\![\W]"          # history # basename of pwd
export PS1="\[\033[0;32m\]\u \033[0;34m\]@ \033[0;36m\]\h: "
export PS1="$PS1\[\$(git_color)\]"       # colors git status
export PS1="$PS1\$(git_branch)"          # prints current branch
export PS1="$PS1\[$BLUE\]\$\[$RESET\] "  # '#' for root, else '$'
