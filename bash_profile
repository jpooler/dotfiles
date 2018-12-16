
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
