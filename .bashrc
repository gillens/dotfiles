# bashrc

# version 2016.03.09

# .bashrc -- initialization for each bash shell invoked.
# nothing here should output anything to the screen.
# if it does, things like sftp (secure ftp) will fail with some weird errors

# this is a pretty bare-bones .bashrc.  We don't really support bash;
# we mainly want to make sure the shell is halfway functional.  You can
# make it spiffy and pretty. :-)  If you have suggestions for some fundamental
# settings here, mail support@engr.orst.edu.   thx

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

############################################################
# First we set a pretty basic path that should work on all
# OS's.  We will be pre and post-pending to it below, with
# OS-specific paths.
############################################################
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/apps/bin
export MANPATH=/usr/local/man:/usr/man:/usr/share/man
export LESS="QMcde"
export MORE="-c"
export PAGER=less
umask 007

############################################################
# Now we add a personal bin directory and '.', which is the
# current directory.  This would be a good place to add
# any other special directories to your path or MANPATH
############################################################
export PATH=$PATH:~/bin:.
#export MANPATH=$MANPATH:

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias z="suspend"
alias la="ls -aF"
alias lf="ls -F"
alias lfa="ls -AF"
alias ll="ls -gl"
alias lla="ls -agl"

# Interactive shell
if [ "$PS1" ]; then
    # Set prompt to be more familiar
    PS1="\h \w \!$ "
fi




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
alias gp='git pull'
alias gu='git push'
alias gb='git branch'
alias gr='git rebase'
alias gf='git fetch --all --prune'

alias gwipe='git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'

alias psme='ps -o ppid,pid,euser,stat,%cpu,rss,args | head -n 1; ps -eH -o ppid,pid,euser,stat,%cpu,rss,args | grep gillens'

__git_complete gch _git_checkout
__git_complete ga _git_add
__git_complete gp _git_pull
__git_complete gu _git_push
__git_complete gb _git_branch
__git_complete gr _git_rebase
