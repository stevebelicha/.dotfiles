export PATH=$HOME/bin:/usr/local/git/bin:$HOME/.rbenv/bin:$HOME/git/bin/git-scripts:/usr/local/opt/imagemagick@6/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:$PATH
eval "$(rbenv init -)"
eval "$(hub alias -s)"

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

set autolist
set filesc
export EDITOR='vim'
export GIT_EDITOR='vim'
export MYSQL_USERNAME='root'
export MYSQL_PASSWORD=''

# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
# NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

# function GIT_BRANCH {
#
  # BRANCH=🖖" "${WHITE}" [git branch:"${LIME_YELLOW}${BOLD}$(__git_ps1)${WHITE}"] "
  # echo ${BRANCH}
# }

#export SSL_CERT_FILE="/usr/local/etc/openssl/cacert.pem"
#export CC=/usr/bin/gcc
export GIT_PS1_SHOWDIRTYSTATE=true

#sets up the prompt color (currently a green similar to linux terminal)
# export PS1="\r\n${WHITE}[${LIME_YELLOW}#\# - \t${WHITE}] 🖖  [${GREEN}${BOLD}\u: \w${WHITE}]\$(GIT_BRANCH) \r\n$ "

# export SO_ES_MYSAGEONE_SERVER=http://sbelicha-so-es.ngrok.com

#enables color for iTerm
export TERM=xterm-color
export LSCOLORS="DxGxFxdxCxdxdxhbadExEx"

#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hla'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -la'
alias c='clear'
alias s='sudo'
alias b='bundle'
alias be='bundle exec'
alias sm='bundle exec rake db:migrate'
alias rs='bundle exec rails s'
alias threaded='bundle exec thin start --threaded'
alias ss='rs'
alias sc='bundle exec rails c'
alias st='bundle exec rake spec'
alias stf='bundle exec rspec'
alias smt='bundle exec rake db:migrate RAILS_ENV=test'
alias ber='bundle exec rake'
alias bef='bundle exec fudge build'
alias sj='bundle exec rake sop_ui:jasmine_compile'
alias sg='bundle exec guard'
alias db_setup='bundle exec rake db:drop db:create db:migrate && bundle exec rake db:seed'
alias db_setup_test='bundle exec rake db:drop db:create db:migrate RAILS_ENV=test && bundle exec rake db:seed RAILS_ENV=test'
alias db_load='bundle exec rake db:drop db:create db:load_startpoint_and_migrate'
alias gs='git status'
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gc='git commit -v'
alias gitx='open /Applications/GitX.app'
alias jobs='bundle exec rake jobs:work'
alias jobs-clean='bundle exec rake jobs:clear'
alias wtf='git reset --hard && git clean -xdf'
alias vi='vim'
alias clear_vim='rm -rf ~/.vim/tmp/*'
alias acc-es='cd ~/sites/es/sageone_es'
alias mso-es='cd ~/sites/es/mysageone_es'
alias add-es='cd ~/sites/es/sage_one_addons_es'
alias mso-pt='cd ~/sites/pt/mysageone_pt'
alias acc-pt='cd ~/sites/pt/sageone_pt'
alias gac='cd ~/sites/gac/sage_one_advanced'
alias addons='cd ~/sites/gac/sage_one_addons'
alias pi='ssh pi@192.168.1.100'
alias clean-assets='bundle exec rake assets:clean RAILS_ENV=development'
alias ..='cd ..'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# function docker_start() {
  # docker-machine start default
  # docker-machine env
  # eval "$(docker-machine env default)"
  # eval "$(aws ecr get-login --region eu-west-1)"
# }
#
# export NVM_DIR="$HOME/.nvm"
# [ "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#
