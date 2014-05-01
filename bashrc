export EDITOR=vim
alias ll="ls -lah"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
source ~/git/dotfiles/git_colors.sh
source ~/git/dotfiles/git-completion.bash

#Host Aliases
alias volb="ssh vpc-odin-lb.aws.p11a.com"

#source ~/.bash-powerline.sh

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

