[[ -s ~/.bashrc ]] && source ~/.bashrc
export CLICOLOR=1
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
export PATH=$PATH:~/git/odin-deploy/util

if [ -d ~/.local/bin ]; then
	export PATH=~/.local/bin:$PATH
fi

if [ -d ~/.local/lib/python2.7/site-packages ]; then
	  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH

# Ant options
export ANT_OPTS="-Xmx1g -Djsse.enableSNIExtension=false"
export PATH=/usr/local/bin:$PATH
export PATH=/bin:/bin:/Users/jarrod/.pyenv/shims:/bin:/usr/local/bin:/Users/jarrod/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/jarrod/git/odin-deploy/util
eval export PYENV_SHELL=bash
source '/usr/local/Cellar/pyenv/20140404/libexec/../completions/pyenv.bash'
pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "`pyenv "sh-$command" "$@"`";;
  *)
    command pyenv "$command" "$@";;
  esac
}
