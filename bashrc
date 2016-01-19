shopt -s expand_aliases
shopt -s cmdhist
shopt -s histappend
export EDITOR=vim
export BYOBU_PREFIX=$(brew --prefix)
source ~/ansible/hacking/env-setup &> /dev/null

export HISTSIZE=25000
export HISTFILESIZE=999999
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignoredups:erasedups
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTIGNORE="ls:ps:history"

alias ll="ls -lah"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias hg='history | grep $1'
alias sln='ssh lnbox'


source ~/Tools/git/dotfiles/git_colors.sh
source ~/Tools/git/dotfiles/git-completion.bash
#source ~/Tools/git/ansible_upstream/hacking/env-setup

#source ~/.bash-powerline.sh

#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/sbin"
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi
if [ -f `brew --prefix`/etc/bash_completion.d/pip ]; then
    source `brew --prefix`/etc/bash_completion.d/pip
fi
