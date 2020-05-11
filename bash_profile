
[ -s ~/.bashrc ] && source ~/.bashrc
[ -s ~/.profile ] && source ~/.profile

#complete -C '/usr/local/bin/aws_completer' aws
complete -C '/Users/jpooler/Library/Python/2.7/bin/aws_completer' aws

alias build="bundle exec build"

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

[ -s "/Users/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jpooler/.scm_breeze/scm_breeze.sh"


[ -s "/Users/jarrod/.scm_breeze/scm_breeze.sh" ] && source "/Users/jarrod/.scm_breeze/scm_breeze.sh"

if [ -d "$HOME/Tools/platform-tools" ] ; then
    export PATH="$HOME/Tools/platform-tools:$PATH"
fi
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## To enable shims and autocompletion add to your profile:
#export JENV_ROOT=/usr/local/opt/jenv
#if which jenv > /dev/null; then eval "$(jenv init -)"; fi
#
#
#export PATH="/Users/jpooler/.jenv/shims:${PATH}"
#export JENV_SHELL=bash
#export JENV_LOADED=1
#unset JAVA_HOME
#source '/usr/local/Cellar/jenv/0.5.1/libexec/libexec/../completions/jenv.bash'
#jenv rehash 2>/dev/null
#jenv() {
#  typeset command
#  command="$1"
#  if [ "$#" -gt 0 ]; then
#    shift
#  fi
#
#  case "$command" in
#  enable-plugin|rehash|shell|shell-options)
#    eval `jenv "sh-$command" "$@"`;;
#  *)
#    command jenv "$command" "$@";;
#  esac
#}
