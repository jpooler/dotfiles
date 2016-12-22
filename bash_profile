if [ -f `brew --prefix`/etc/bash_completion ]; then 
    . `brew --prefix`/etc/bash_completion 
fi
[[ -s ~/.bashrc ]] && source ~/.bashrc

complete -C '/usr/local/bin/aws_completer' aws

#export PATH=/usr/local/bin/aws:$PATH

