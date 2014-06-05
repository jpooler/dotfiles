shopt -s expand_aliases
shopt -s histappend
shopt -s cmdhist
export EDITOR=vim
export BYOBU_PREFIX=$(brew --prefix)


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


source ~/git/dotfiles/git_colors.sh
source ~/git/dotfiles/git-completion.bash

#Host Aliases
alias volb="ssh vpc-odin-lb"
alias os1="ssh odin-search-01"
alias os2="ssh odin-search-02"
alias os3="ssh odin-search-03"
alias os4="ssh odin-search-04"
alias osd1="ssh deploy@odin-search-01"
alias osd2="ssh deploy@odin-search-02"
alias osd3="ssh deploy@odin-search-03"
alias osd4="ssh deploy@odin-search-04"

alias oa1="ssh odin-api-01" 
alias oa2="ssh odin-api-02" 
alias oa3="ssh odin-api-03" 
alias oa4="ssh odin-api-04" 
alias oa5="ssh odin-api-05"
alias oa6="ssh odin-api-06" 
alias oad1="ssh deploy@odin-api-01" 
alias oad2="ssh deploy@odin-api-02" 
alias oad3="ssh deploy@odin-api-03" 
alias oad4="ssh deploy@odin-api-04" 
alias oad5="ssh deploy@odin-api-05"
alias oad6="ssh deploy@odin-api-06" 
alias ou1="ssh odin-util-01" 
alias ou1="ssh odin-util-01" 
alias ou2="ssh odin-util-02" 
alias oud1="ssh deploy@odin-util-01" 
alias oud2="ssh deploy@odin-util-02" 
alias oadm1="ssh odin-admin-01" 
alias oadmd1="ssh deploy@odin-admin-01" 






#source ~/.bash-powerline.sh

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

