export PATH=".:$PATH"
PATH=/usr/local/bin:$PATH
PATH=/usr/local/mysql/bin:$PATH

#tweak command line prompt to be simpler
export PS1="[\W] $ "

# colorize the terminal
# DARK
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# LIGHT
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# prettify ls output
alias ls='ls -GFh'

# RVM Path and shell function setup
PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# virtual env settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dev
source /usr/local/bin/virtualenvwrapper.sh
