
[ -s ~/.bashrc ] && source ~/.bashrc

#complete -C '/usr/local/bin/aws_completer' aws
complete -C '/Users/jpooler/Library/Python/2.7/bin/aws_completer' aws

alias build="bundle exec build"

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

[ -s "/Users/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jpooler/.scm_breeze/scm_breeze.sh"

