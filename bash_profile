[[ -s ~/.bashrc ]] && source ~/.bashrc
export CLICOLOR=1
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
export PATH=$PATH:~/production/odin-deploy/util

# Ant options
export ANT_OPTS="-Xmx1g -Djsse.enableSNIExtension=false"
