alias sshcs='ssh gjosep02@linux.cs.tufts.edu'
alias sshtmc='ssh gjoseph@tuftsmountainclub.org'
alias cdtmc='cd /Users/gjoseph/Documents/Projects/TMC/dev'
alias cls='clear; ls'
alias parent='ps -o comm= -p $PPID'
alias markdown='multimarkdown'
export PATH="$PATH:/usr/local/sbin"

CS_USERNAME="gjosep02"
scpcs() {
  if [ $# -lt 2 ]
    then
      echo "Useage: scpcs files destination/path/on/cs/server"
      return
  fi
  numfiles=$(($#-1))
  files=${@:1:$numfiles}
  dest="${!#}"
  ssh $CS_USERNAME@linux.cs.tufts.edu "mkdir -p $dest"
  scp -r $files "$CS_USERNAME@linux.cs.tufts.edu:$dest"
  ssh $CS_USERNAME@linux.cs.tufts.edu -t "cd $dest ; exec \$SHELL"
}

provide() {
  if [ $# -lt 4 ]
    then
      echo "Useage: provide class assignment files destination/path/on/cs/server"
      return
  fi
  numfiles=$(($#-3))
  class=$1
  assignment=$2
  files=${@:3:$numfiles}
  dest="${!#}"
  ssh $CS_USERNAME@linux.cs.tufts.edu "mkdir -p $dest"
  scp -r $files "$CS_USERNAME@linux.cs.tufts.edu:$dest"
  ssh $CS_USERNAME@linux.cs.tufts.edu -t "cd $dest ; provide $class $assignment $files"
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
PS1='\[\e[0;32m\]\h:\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

# Path for OpenCV in Python
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

