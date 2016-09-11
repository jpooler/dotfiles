shopt -s expand_aliases
shopt -s histappend
shopt -s cmdhist
export EDITOR=vim

source ~/Tools/dotfiles/git_colors.sh
source ~/Tools/dotfiles/git-completion.bash
export BYOBU_PREFIX=$(brew --prefix)

export HISTSIZE=25000
export HISTFILESIZE=999999
#export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignoredups:erasedups
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTIGNORE="ls:ps:history"
#eval $(docker-machine env default)
#Modify to not remove all containers
#drm() { docker rm $(docker ps -q -a); }
db() { docker build -t="$1" .; }
dcb() { docker-compose build "$1" ; }
#dri() { docker rmi $(docker images -q); }


alias ll="ls -lah"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias hg='history | grep $1'
alias rdm='unset ${!DOCKER_*}'
alias dps='docker ps'
alias rui="docker rmi $(docker images | grep "^<none>" | awk '{print $3}')"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias uvp="cd ~/.vim && git submodule update --init && git submodule foreach git pull origin master"


complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

#export PATH="$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


[ -s "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh"

#. ~/.docker-completion.sh
#. ~/.docker-machine-completion.sh
#. ~/.docker-compose-completion.sh

