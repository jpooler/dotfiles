[ -s /Users/jpooler/.bashrc ] && source /Users/jpooler/.bashrc
[ -s ~/.profile ] && source ~/.profile

#complete -C '/usr/local/bin/aws_completer' aws
#complete -C '/Users/jpooler/Library/Python/2.7/bin/aws_completer' aws

alias build="bundle exec build"

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi



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
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[ -s "/home/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/home/jpooler/.scm_breeze/scm_breeze.sh"
export PATH=$HOME/homebrew/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"

[ -s "/Users/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jpooler/.scm_breeze/scm_breeze.sh"
export PATH="/Users/jpooler/homebrew/bin/gettext:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1
export LDFLAGS="-L/Users/jpooler/homebrew/bin/gettext/lib"
export CPPFLAGS="-I/Users/jpooler/homebrew/bin/gettext/include"
export PATH="/Users/jpooler/homebrew/sbin:$PATH"


export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.8/libexec/bin/python"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

export PATH=$HOME/homebrew/opt/mysql@5.7/bin:$PATH
. "$(brew --prefix asdf)/asdf.sh"
. "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"

export PATH="/Users/jpooler/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/Users/jpooler/Applications/helm/helm:$PATH"
 #export AWS_PROFILE=efs_aws_prod
