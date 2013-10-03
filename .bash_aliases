#!/bin/bash
alias attask='cd ~/src/attask/'
alias open='nautilus'
export JAVA_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000,suspend=n"
alias install='time sudo apt-get -y install $@'
alias search='apt-cache search $@'
alias apt-get-upgrade='sudo apt-get update && time sudo apt-get -y dist-upgrade'
alias jboss='/home/josephbass/src/jboss/bin/standalone.sh -b 0.0.0.0'
alias webs='python -m SimpleHTTPServer'
alias noise='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;3$(($RANDOM % 8))" grep --color "[^ ]"'
alias distract='cat /dev/urandom | hexdump -C | grep "be ef"'
alias lock='xscreensaver-command -lock && exit'
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset | %an | %cn | -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gst='git status'
alias gsh='git show'
export HISTSIZE=100000000
#export HISTFILESIZE=100000000
#unset HISTSIZE
unset HISTFILESIZE
export HISTTIMEFORMAT="%F %T "
ANDROID_HOME=~/opt/android-sdk-linux
PATH=${JAVA_HOME}/bin:${PATH}
PATH=~/bin:${PATH}
if [[ -d "${ANDROID_HOME}" ]] ; then
		PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}
		export ANDROID_HOME
fi
export PATH
shopt -s histappend
export EDITOR=vim
# set -o vi
if [ -f ~/src/liquidprompt/liquidprompt ]; then
		. ~/src/liquidprompt/liquidprompt
else
		. ~/.bash_setup_ps1
fi

if [ -f ~/.bash_functions ]; then
		. ~/.bash_functions
fi
