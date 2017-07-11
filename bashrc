shopt -s expand_aliases
export EDITOR=vim
export PIP_REQUIRE_VIRTUALENV=true
source ~/Tools/dotfiles/git_colors.sh
source ~/Tools/dotfiles/git-completion.bash
source ~/Tools/dotfiles/tmuxinator_completion.bash
source ~/Tools/dotfiles/testkitchen_completion.bash

# History Fix
export HISTTIMEFORMAT="%y-%m-%d %T " # Set the history datetime format
export HISTCONTROL=ignoredups:erasedups:ignorespace # Deduplicate history entries
export HISTSIZE=250000000 # Save more history in memory
export HISTFILESIZE=100000 # Save more history to the history file
export HISTIGNORE="ls:ps:history"
shopt -s histappend # Set the history serialization to append instead of overwrite
shopt -s cmdhist

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
export HISTFILESIZE=10000        # increase history file size (default is 500)
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

export BYOBU_PREFIX=$(brew --prefix)

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
alias novars="docker logs -f $(docker ps | awk '/novars/ {print $NF}')"

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/Users/jarrod.pooler/Tools/sandbox/go/bin"
export GOPATH="/Users/jarrod.pooler/Tools/sandbox/go"
export PATH="~/Tools/git/tfenv/bin:$PATH"
export PATH="/Users/jarrod.pooler/.chefdk/gem/ruby/2.3.0/bin:$PATH"
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

#export PATH="$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

[ -s "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh"
