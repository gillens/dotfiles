#My stuff
#trap 'PREVIOUS_COMMAND=$THIS_COMMAND; THIS_COMMAND=$BASH_COMMAND' DEBUG
#read -r -d '' PROMPT_COMMAND << 'END'
#if [ $? = 0 -o $? == 130 -o "$PREVIOUS_COMMAND" = ": noop" ]; then
#  PS1='\[\e[32;1m\]\u@\[\e[0m\e[30;47m\]\H\[\e[0m\]:\[\e[34;1m\]\w\[\e[0m\]$ '
#else
#  PS1='\[\e[31;1m\]\u@\[\e[0m\e[31;47m\]\H\[\e[0m\]:\[\e[31;1m\]\w\[\e[0m\]$ '
#fi
#: noop
#END

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export EDITOR='vim'
export VISUAL='vim'

#aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gch='git checkout'
alias gp='git push'

alias psme='ps -o ppid,pid,euser,stat,%cpu,rss,args | head -n 1; ps -eH -o ppid,pid,euser,stat,%cpu,rss,args | grep gillens'
