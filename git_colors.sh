#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BOLDGREEN='\033[0;36m'
OCHRE='\033[38;5;95m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RESET='\033[0m'
#
#function git_color {
#  local git_status="$(git status --porcelain 2> /dev/null)"
#
#  if [[ ! $git_status =~ "working tree clean" ]]; then
#    echo -e $RED
#  else if [[ $git_status =~ "Your branch is ahead of" ]]; then
#    echo -e $YELLOW
#  else if [[ $git_status =~ "nothing to commit" ]]; then
#    echo -e $GREEN
#  else
#    echo -e $OCHRE
#  fi fi fi
#}
#
#function git_branch {
#  local git_status="$(git status 2> /dev/null)"
#  local pattern="^On branch ([^${IFS}]*)"
#
#  if [[ $git_status =~ $pattern ]]; then
#    local branch=${BASH_REMATCH[1]}
#    echo "($branch)"
#  fi
#}
#
#
##parse_git_branch() {
##    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
##    }
#
export PS1="\[$BLUE\][\t] \[$GREEN\]\u \[$BLUE\]@ \[$BOLDGREEN\]\h:[\w]"

###export PS1="\[\033[0;32m\]\u \[\033[0;34m\]@ \[\033[0;36m\]\h:[\w] "
###export PS1="$BLUE[\t] $GREEN\u $BLUE@ $BOLDGREEN\h:[\w]"
###export PS1="$PS1\[$(git_color)\]"       # colors git status
###export PS1="$PS1$(git_branch)"          # prints current branch
###export PS1="$PS1\[$BLUE\]\$\[$RESET\] "  # '#' for root, else '$'
##
#export PS1="$PS1\[\$(git_color)\]"       # colors git status
#export PS1="$PS1\$(git_branch)"          # prints current branch
##export PS1="$PS1\$(parse_git_branch)"          # prints current branch
#export PS1="$PS1\[$BLUE\]\$\[$RESET\] "  # '#' for root, else '$'
#export PS1;
##
### Git branch in prompt.
##parse_git_branch() {
##    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
##    }
##    export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}

function markup_git_branch {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

export PS1="$PS1\$(markup_git_branch \$(git_branch)) "
export PS1="$PS1\[$BLUE\]\$\[$RESET\] "
