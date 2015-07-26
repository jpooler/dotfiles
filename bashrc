shopt -s expand_aliases
shopt -s histappend
shopt -s cmdhist
export EDITOR=vim
export BYOBU_PREFIX=$(brew --prefix)

# curl http://monitor.mt.corp.web/cgi-bin/objects.cache.cgi > ~/bin/machines

export HISTSIZE=25000
export HISTFILESIZE=999999
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:ps:history"



alias ll="ls -lah"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias hg='history | grep $1'


source ~/git/dotfiles/git_colors.sh
source ~/git/dotfiles/git-completion.bash

#source ~/.bash-powerline.sh

#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/sbin"
