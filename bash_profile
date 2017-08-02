
[[ -s ~/.bashrc ]] && source ~/.bashrc

complete -C '/usr/local/bin/aws_completer' aws

#export PATH=/usr/local/bin/aws:$PATH

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


[ -s "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh"
