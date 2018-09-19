# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jnrowe"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git hub osx ruby rails cp gem lol pow postgres)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Custom aliases
# eval "$(hub alias -s)"

alias rake="noglob rake"
alias mond="sudo mongod run --config /usr/local/etc/mongod.conf --logpath /tmp/mongod.log --noprealloc --smallfiles --fork"
# alias rediss="launchctl load /usr/local/Cellar/redis/2.8.9/homebrew.mxcl.redis.plist"
# alias pgs="launchctl load /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist"
alias gam='git commit -am'
alias fuckoff='bundle; bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test;'
alias delmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gcb='git checkout -b'
# alias gic='git icdiff | less'
alias gitlog='git log  --graph --oneline --stat --pickaxe-all'
alias be='bundle exec'
alias donepr='gcm; gl; delmerged;'
alias flushdns='sudo discoveryutil mdnsflushcache'
# alias pd='ggp && cap deploy'
alias pd='ggp && eb deploy'
alias tcon='eb ssh --command "sudo /root/rc.sh"'

# install rmtrash, (either from the macports or by the brew.)
alias trash="rmtrash"
alias del="rmtrash"       # del / trash are shorter than rmtrash
alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"


alias flifi="sudo ifconfig en0 down && sudo route flush && sudo ifconfig en0 up"

starthb() {
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.$*.plist;
}
stophb() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.$*.plist;
}

# https://transfer.sh/
source ~/dotfiles/transfer.sh

#PyEnv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# RBenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:~/.local/bin:~/bin

#nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# My functions
function mcd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
function c() {
  bin_name="${1%.c}.bin"
  gcc "$1" -o $bin_name
}
# function c() {
#   bin_name="${1%.c}.bin"
#   gcc "$1" -o $bin_name && ./$bin_name
# }

#### Startup info ####

# fortunes!
function show_fortune {
  RANGE=4
  number=$RANDOM
  let "number %= $RANGE"
  case $number in
      0) cow="moose"; ;;
      1) cow="tux"; ;;
      2) cow="koala"; ;;
      3) cow="cow"; ;;
  esac

  RANGE=2
  number=$RANDOM
  let "number %= $RANGE"
  case $number in
      0) command="cowsay"; ;;
      1) command="cowthink"; ;;
  esac

  if [[ "$cow" == "cow" ]]; then
    fortune | $command
  else
    fortune | $command -f $cow
  fi
}

show_fortune

# twitter!
# echo "Last 3 tweets..."
# t timeline -n 3

