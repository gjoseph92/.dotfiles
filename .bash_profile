alias sshcs='ssh gjosep02@linux.cs.tufts.edu'
alias sshtmc='ssh gjoseph@tuftsmountainclub.org'
alias cdtmc='cd /Users/gjoseph/Documents/Projects/TMC/TMC'
alias cls='clear; ls'
alias parent='ps -o comm= -p $PPID'
alias markdown='multimarkdown'
export PATH="$PATH:/usr/local/sbin"

scpcs() {
  numfiles=$(($#-1))
  files=${@:1:$numfiles}
  dest="${!#}"
  ssh gjosep02@linux.cs.tufts.edu "mkdir -p $dest"
  scp -r $files "gjosep02@linux.cs.tufts.edu:$dest"
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

# Path for OpenCV in Python
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
