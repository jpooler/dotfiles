shopt -s expand_aliases
export EDITOR=vim
#export PIP_REQUIRE_VIRTUALENV=true

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#[ -s ~/.bash_profile ] && source ~/.bash_profile
export PATH=$HOME/homebrew/bin:$PATH
source ~/dotfiles/git_colors.sh
source ~/dotfiles/git-completion.bash
source ~/dotfiles/tmuxinator_completion.bash
source ~/dotfiles/testkitchen_completion.bash

# History Fix
#export HISTTIMEFORMAT="%y-%m-%d %T " # Set the history datetime format
export HISTCONTROL=ignoredups:erasedups:ignorespace # Deduplicate history entries
export HISTSIZE=250000000 # Save more history in memory
export HISTFILESIZE=100000000 # Save more history to the history file
export HISTIGNORE="ls:ps:history"
shopt -s histappend # Set the history serialization to append instead of overwrite
shopt -s cmdhist

# add this configuration to ~/.bashrc
#https://github.com/dvorka/hstr
export HH_CONFIG=keywords,hicolor,casesensitive         # get more colors
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

export BYOBU_PREFIX=$(brew --prefix)

#drm() { docker rm $(docker ps -q -a); }
#db() { docker build -t="$1" .; }
#dcb() { docker-compose build "$1" ; }
#dri() { docker rmi $(docker images -q); }


# aliases to research
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
# Determine most used CLI command
# Use export HISTTIMEFORMAT=""; first if your history displays timestamps.
# history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
# history | tr -s ' ' | cut -d ' ' -f3 | sort | uniq -c | sort -n | tail | perl -lane 'print $F[1], "\t", $F[0], " ", "▄" x ($F[0] / 12)'

# Added 12/16/18
# Can't find blogpost about this, fml

functions() { cd ~/Tools/git/dotfiles; echo -e "$(cat functions)" | less -R; }

isthere() { if (($(grep -c -m 1 "$1" "$3"))); then echo "YES"; else echo "NO"; fi; }
function ec2ssh() {
  ssh -C `aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=running" --output text --query "Reservations[0].Instances[0].PublicIpAddress"` $2 $3 $4 $5 $6 $7 $8 $9
}

function vpnssh() {
  #  if [ $(netstat -nr | grep -c "^172.19") -eq 0 ]; then
  #echo "Please connect to the VPN first."
  #exit 1
  #  fi
  if [[ $1 =~ ^i-.* ]]; then
    instance_ip=$(aws ec2 describe-instances --instance-ids $1 --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)
  else
    instance_ip=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=running" --output text --query "Reservations[0].Instances[0].PrivateIpAddress")
  fi
  ssh -C $instance_ip $2 $3 $4 $5 $6 $7 $8 $9

}

function asgssh() {
  if [ "$INDEX" == "" ]; then
    INDEX=0
  fi
  ssh `aws ec2 describe-instances --filters "Name=tag:aws:autoscaling:groupName,Values=$1" "Name=instance-state-name,Values=running" --output text --query "Reservations[0].Instances[0].PrivateIpAddress"` $2 $3 $4 $5 $6 $7 $8 $9
}

function chefssh() {
  if [[ $1 =~ ^i-.* ]]; then
    instance_ip=$(aws ec2 describe-instances --instance-ids $1 --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)
  else
    instance_ip=$1
  fi
  ssh -C -i ~/.ssh/chef-bootstrap-022916.pem ubuntu@$instance_ip $2 $3 $4 $5 $6 $7 $8 $9
}

awsacct_tools=( aws custodian docker kitchen kops rake pry terraform ansible ansible-playbook )
 
function awsacct() {
  security set-keychain-settings -l -u -t 28800 ~/Library/Keychains/aws-vault.keychain-db
  export AWS_ACCOUNT=$1
  case $1 in
  prod)
    #export KOPS_STATE_STORE=s3://
    #kubectl config use-context $CONTEXT > /dev/null
    ;; 
  prod-esc)
  #  #export KOPS_STATE_STORE=
  #  #kubectl config use-context minikube > /dev/null
    ;; 
  *)
    echo "$1 is not defined."
    ;;
  esac
  awsacct_alias_tools
}
 
function awsacct_alias_tools() {
  for i in ${awsacct_tools[@]}; do
    alias $i="aws-vault exec --assume-role-ttl=60m $AWS_ACCOUNT -- $i"
  done
}

#

alias ll="ls -lah"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
#alias vim='/usr/local/Cellar/vim/8.1.1000/bin/vim'
#alias vim='/usr/local/bin/vim'
alias hg='history | grep $1'
alias dps='docker ps'
#alias rui="docker rmi $(docker images | grep "^<none>" | awk '{print $3}')"
#alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias uvp="cd ~/.vim && git submodule update --init && git submodule foreach git pull origin master"
alias k=kubectl
complete -F __start_kubectl k
alias kg="kubectl get po"
alias kd="kubectl get deploy"
alias kpause='kind get nodes|xargs docker pause'
alias kunpause='kind get nodes|xargs docker unpause'
alias as='gcloud beta compute ssh --zone "us-east4-c" "mft-exi-manage-prd-cig-usea4-ansible-3d8f-lrfc" --tunnel-through-iap --project "exi-manage-prd-4ed1"'


#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

#export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
#export PATH="~/Library/Python/2.7/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/Tools/sandbox"
export PATH="~/Tools/git/tfenv/bin:$PATH"
export GOPATH=$HOME/Tools/go_learning
export PATH=$PATH:$HOME/Tools/go_learning/bin
export PATH="$GOPATH:$PATH"
export PATH="/Users/jpooler/.gem/ruby/2.3.0/bin:$PATH"
#export PATH="$HOME/.asdf/installs/terraform/0.14.4/bin/:$PATH"
#export PATH="$HOME/.asdf/installs/terraform/0.13.6/bin/:$PATH"
export PATH="$HOME/.asdf/installs/terraform/0.12.29/bin/:$PATH"
#export PATH="$HOME/.asdf/installs/terraform/0.11.14/bin/:$PATH"
#export PATH="/opt/local/bin:$PATH"
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export  VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python@3.8/bin/python3

#Python has been installed as
#  /usr/local/opt/python@3.8/bin/python3
#
#You can install Python packages with
#  /usr/local/opt/python@3.8/bin/pip3 install <package>
#They will install into the site-package directory
#  /usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages
#
#See: https://docs.brew.sh/Homebrew-and-Python
#
#python@3.8 is keg-only, which means it was not symlinked into /usr/local,
#because this is an alternate version of another formula.
#
#If you need to have python@3.8 first in your PATH run:
#  echo 'export PATH="/usr/local/opt/python@3.8/bin:$PATH"' >> ~/.bash_profile
#
#For compilers to find python@3.8 you may need to set:
#  export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
#
#For pkg-config to find python@3.8 you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"
#

#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

#export WORKON_HOME=~/Tools/pythonenvs
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh



#export PATH="$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

#[ -s "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jarrod.pooler/.scm_breeze/scm_breeze.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -s "/Users/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/Users/jpooler/.scm_breeze/scm_breeze.sh"

#eval "$(rbenv init -)"

export PATH="/opt/chefdk/bin:$PATH"

export KITCHEN_YAML=.kitchen.yml
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml

export PATH="$HOME/.rbenv/bin:$PATH"
# Export for mysql client CLI
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS



bundle_wrapper() {
  for required_file in Gemfile; do
    if [[ ! -f ${required_file} ]]; then
      echo -e "error: ${required_file} not found; aborting" >&2
      return 1
    fi
  done

  if ! command -v bundler >/dev/null 2>&1; then
    echo -e "error: \`bundler' not found in ${PATH}; aborting" >&2
    return 1
  fi
  return 0
}

brak() {
  bundle_wrapper || return 1

  bundle exec rake "${@}"
  return $?
}

berc() {
  bundle_wrapper || return 1

  bundle exec rubocop "${@}"
  return $?
}

bekc() {
  bundle_wrapper || return 1

  bundle exec kitchen converge
  return $?
}

be() {
  bundle_wrapper || return 1

  bundle exec "${@}"
  return $?
}
bebi() {
  bundle_wrapper || return 1

  bundle exec bundle install
  return $?
}
bebp() {
  bundle_wrapper || return 1

  bundle exec build prepare
  return $?
}


#function tfinit() {
#  aws-vault exec $AWS_ACCOUNT -- terraform init && terraform get -update
#}
#
#function tfplan() {
#  aws-vault exec $AWS_ACCOUNT -- terraform plan
#}

function fa() {
     for i in AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID; do unset $i; echo "$i unset"; done
 }

# Assumes Terraform workspaces are in use

# Functions we'll use for tfinit, tfplan and tfapply in this repo
#TODO Add in some tests if not using environments pattern for vars
# 
function tfinit() {
ENV_ARRAY=( "sbx:sandbox-nebula"
        "dev:development-nebula" 
        "qat:qa-nebula" 
        "staging:staging-nebula" 
        "production:production-nebula" )

for account in "${ENV_ARRAY[@]}" ; do
    KEY=${account%%:*}
    VALUE=${account#*:}
    echo "KEY: %s VALUE: %s.\n" "$KEY" "$VALUE"
done

    #export AWS_PROFILE=
    vertical=csbb
    #vertical=scff
    application=`grep -Hr "app_name" ../environments/global.tfvars | sed -e 's/.*\=\ //' | sed -e 's/"//g'`
    #application=$2
    if [ -z "$application" ]; then
        application=$2
        if [ -z "$2" ]; then
        echo "Application not set, please supply another var"
        echo -e "\nusage: tfinit <environment> <application>\n"
        return 1
    fi
    fi
    echo "Application is $application"
#
#    if [ -z "$2" ]; then
#        echo "Application not set, please supply another var"
#        echo -e "\nusage: tfinit <environment> <application>\n"
#        return 1
#    fi
#
    if [ -z "$1" ]; then
        echo "ERROR: Must supply an environment , such as 'sbx,dev,qat,stg,prd'"
        echo -e "\nusage: tfinit <environment>\n"
        return 1
    fi
    rm -rf "${PWD}/.terraform"
    terraform init -backend-config="bucket=$1-nebula-apps-terraform" -backend-config="dynamodb_table=$1-nebula-apps-terraform" -backend-config="key=$1/${vertical}/${application}.tfstate"  -backend-config="region=us-east-1" 
}

function tfplan() {
    # add block to test if supplied environments match 
    local_version=`cat .terraform/terraform.tfstate  | jq -r '.backend.config.bucket' | sed -e 's/\-.*//'`
    if [ -z "$1" ]; then
        echo "ERROR: Must supply an environment , such as 'sbx,dev,qat,stg,prd'"
        echo -e "\nusage: tfinit <environment>\n"
        return 1
    fi
    var_file="$1.tfvars"
    global_file="global.tfvars"
    [ ! -f "$var_file" ] && var_file="../environments/$1.tfvars" && global_file="../environments/$global_file"
    [ "$1" == "$local_version" ] && terraform plan -var-file="$var_file" -var-file="$global_file" ${@:2} && return 1
    
    tfinit $1 && \
    terraform plan -var-file="$var_file" -var-file="$global_file" ${@:2}
}

function tfapply() {
    if [ -z "$1" ]; then
        echo "ERROR: Must supply an environment , such as 'sbx,dev,qat,stg,prd'"
        echo -e "\nusage: tfinit <environment>\n"
        return 1
    fi
    var_file="$1.tfvars"
    global_file="global.tfvars"
    [ ! -f "$var_file" ] && var_file="../environments/$1.tfvars" && global_file="../environments/$global_file"
    tfinit $1 && \
    [ -f "$2" ] && terraform apply "$2" || terraform apply -var-file="$var_file" -var-file="$global_file" ${@:2}
}

#tunnel <Jumphost DNS> <Application port> <Localhost port> <Node tunneling to>
tunnel() {
    PROXYHOST=$1
    RPORT=$2
    LPORT=$3
    PASSTHRUHOST=$4

    if [ -z $LPORT ]; then
        LPORT=$RPORT
    fi

    if [ -z $PASSTHRUHOST ]; then
        PASSTHRUHOST=localhost
    fi

    ssh $PROXYHOST -L ${LPORT}:$PASSTHRUHOST:${RPORT}
}


#alias vault_timeout="security set-keychain-settings -l -u -t 28800 ~/Library/Keychains/aws-vault.keychain-db"
# Make this a generic "file" parser
#alias on_containers="grep ^module containers.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
#alias on_resource="grep ^resource wavefront_http.tf | sed -e 's/resource \"/-target=/g' -e 's/\" \"/./g'  -e 's/\" {/ /g' | tr -d '\n'"

#alias tf_pr="terraform plan $(git diff origin/master..HEAD | grep 'resource "' | sed -e 's/.*resource "/-target=/' -e 's/" "/./' -e 's/" {/ /' | tr -d '\n')"


#pipenv ftw
alias bb="brew bundle"
alias bu="brew update && brew upgrade `brew outdated`"
# Enable pipenv completion
eval "$(pipenv --completion)"
#function cd {
#    builtin cd "$@"
#    if [ -f "Pipfile" ] ; then
#        pipenv shell
#    fi
#}

## Activate current folder's pipenv virtualenv
## or accept an explicit virtualenv name
#workon() {
#    if [ $# -eq 0 ]
#    then
#        source "$(pipenv --venv)/bin/activate"
#    else
#        source "~/.virtualenvs/$1/bin/activate"
#    fi
#}
#
## Making virtualenv alias
#mkvenv() {
#    cd ~/.virtualenvs
#    virtualenv "$@"
#    cd -
#    workon "$1"
#}
#
## Automatic virtualenv sourcing
#function auto_pipenv_shell {
#    if [ ! -n "$VIRTUAL_ENV" ]; then
#        if [ -f "Pipfile" ] ; then
#            workon
#        fi
#    fi
#}
#function cd {
#    builtin cd "$@"
#    auto_pipenv_shell
#}
#auto_pipenv_shell


#[ -s "/home/jpooler/.scm_breeze/scm_breeze.sh" ] && source "/home/jpooler/.scm_breeze/scm_breeze.sh"

[ -s "/home/jpooler-r2b2/.scm_breeze/scm_breeze.sh" ] && source "/home/jpooler-r2b2/.scm_breeze/scm_breeze.sh"
