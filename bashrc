shopt -s expand_aliases
export EDITOR=vim
#export PIP_REQUIRE_VIRTUALENV=true

source ~/Tools/git/dotfiles/git_colors.sh
source ~/Tools/git/dotfiles/git-completion.bash
source ~/Tools/git/dotfiles/tmuxinator_completion.bash
source ~/Tools/git/dotfiles/testkitchen_completion.bash

# History Fix
#export HISTTIMEFORMAT="%y-%m-%d %T " # Set the history datetime format
export HISTCONTROL=ignoredups:erasedups:ignorespace # Deduplicate history entries
export HISTSIZE=250000000 # Save more history in memory
export HISTFILESIZE=100000000 # Save more history to the history file
export HISTIGNORE="ls:ps:history"
shopt -s histappend # Set the history serialization to append instead of overwrite
shopt -s cmdhist

# add this configuration to ~/.bashrc
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

awsacct_tools=( aws kitchen kops rake pry terraform )
 
function awsacct() {
  security set-keychain-settings -l -u -t 28800 ~/Library/Keychains/aws-vault.keychain-db
  export AWS_ACCOUNT=$1
  case $1 in
  prod)
  #  #export KOPS_STATE_STORE=
  #  #kubectl config use-context minikube > /dev/null
    ;; 
  mgmt)
  #  export KOPS_STATE_STORE=
  #  kubectl config use-context minikube > /dev/null
    ;;
  redshirt)
    #export KOPS_STATE_STORE=s3://k8s-clusters.us1.cloudhealthtech.dev
    #kubectl config use-context us1.cloudhealthtech.dev > /dev/null
    ;;
  staging)
    export KOPS_STATE_STORE=s3://clusters.staging.cloudhealthtech.com
    kubectl config use-context us1.staging.cloudhealthtech.com > /dev/null
    ;;
  ngprod)
    export KOPS_STATE_STORE=s3://clusters.prod.cloudhealthtech.com
    kubectl config use-context us1.prod.cloudhealthtech.com > /dev/null
    ;;
  ngprod-esc)
    export KOPS_STATE_STORE=s3://clusters.prod.cloudhealthtech.com
    kubectl config use-context us1.prod.cloudhealthtech.com > /dev/null
    ;;
  ngdev)
    export KOPS_STATE_STORE=s3://clusters.dev.cloudhealthtech.com
    kubectl config use-context us1.dev.cloudhealthtech.com > /dev/null
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
alias vim='/usr/local/bin/vim'
alias hg='history | grep $1'
#alias dps='docker ps'
#alias rui="docker rmi $(docker images | grep "^<none>" | awk '{print $3}')"
#alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias uvp="cd ~/.vim && git submodule update --init && git submodule foreach git pull origin master"
alias k=kubectl
complete -F __start_kubectl k
alias kp="kubectl get po"
alias kd="kubectl get deploy"


#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh rsync

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
#export PATH="~/Library/Python/2.7/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="~/Tools/git/tfenv/bin:$PATH"
export GOPATH=$HOME/Tools/go_learning
export PATH=$PATH:$HOME/Tools/go_learning/bin
export PATH="$GOPATH:$PATH"
export PATH="/Users/jpooler/.gem/ruby/2.3.0/bin:$PATH"
#export PATH="/opt/local/bin:$PATH"
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

#export WORKON_HOME=~/Tools/pythonenvs
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh



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

# Functions we'll use for tfinit, tfplan and tfapply in this repo

function tfinit() {
    if [ -z "$1" ]; then
        echo "ERROR: Must supply a workspace, such as 'us-east-1'"
        echo -e "\nusage: tfinit <workspace>\n"
        return 1
    fi
    # Test if workspace can be used
    terraform workspace select "$1" >/dev/null 2>/dev/null
    # If it fails, init is required before using any non-default workspace
    if [ $? -ne 0 ]; then
        # Init may fail on backend and that's okay
        terraform init || echo -e "\nINFO: Init with default workspace Completed.  The above error is expected.  YMMV.\n\n\n"
    fi
    # Need to switch to desired workspace before init
    terraform workspace select "$1"
    terraform init
}

function tfplan() {
    if [ -z "$1" ]; then
        echo "ERROR: Must supply a workspace, such as 'us-east-1'"
        echo -e "\nusage: tfplan <workspace>\n"
        return 1
    fi
    var_file="$1.tfvars"
    [ ! -f "$var_file" ] && var_file="../$1.tfvars"
    [ ! -f "$var_file" ] && var_file="../../$1.tfvars"
    tfinit $1 && \
    terraform plan -var-file="$var_file" ${@:2}
}

function tfapply() {
    if [ -z "$1" ]; then
        echo "ERROR: Must supply a workspace, such as 'us-east-1'"
        echo -e "\nusage: tfapply <workspace>\n"
        return 1
    fi
    var_file="$1.tfvars"
    [ ! -f "$var_file" ] && var_file="../$1.tfvars"
    [ ! -f "$var_file" ] && var_file="../../$1.tfvars"
    tfinit "$1" && \
    [ -f "$2" ] && terraform apply "$2" || terraform apply -var-file="$var_file" ${@:2}
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

alias so='if [ -z $CHT_ROOT ]; then export CHT_ROOT=/Users/jpooler/Tools/git; fi; aws-vault exec cloudsandbox -- rvm ruby-2.3.3@cht-cloud-sandbox do $CHT_ROOT/cht_eng/tools/bin/so.rb'

alias vault_timeout="security set-keychain-settings -l -u -t 28800 ~/Library/Keychains/aws-vault.keychain-db"

alias on_all_assets="grep ^module asset-db.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_all_drilldowns="grep ^module drilldown-db.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_all_collectors="grep ^module workers-collector.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_all_cubes="grep ^module workers-cubes.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_all_resque="grep ^module workers-resque.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_all_processors="grep ^module workers-processor.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"
alias on_containers="grep ^module containers.tf | sed -e 's/module \"/-target=module./g' -e 's/\" {/ /g' | tr -d '\n'"



