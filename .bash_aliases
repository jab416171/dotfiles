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
alias rm='rm -v'
alias ll='ls -ahlrt'
alias sc="grep -Pv '(^#|^\s+#|^\s*$)'"
export environments='cl01-rls-ca cl01-rls-ut cl01-rls-va cl01-stg cl02-rls-ca cl02-rls-ut cl02-rls-va cl02-stg cl03-rls-ca cl03-rls-ut cl03-rls-va cl03-stg crsb01-rls-ca crsb01-rls-ut crsb02-rls-ca crsb02-rls-ut finance-rls-ut finance-rls-va hub-rls-ca hub-rls-ut hub-rls-va hub-stg load-stg mig-rls-ut pvcl01-rls-ca pvcl02-rls-ca pvcl03-rls-ca sb01-rls-ut sb02-rls-ut sb03-rls-ut scale-stg td-rls-ca td-rls-ut td-rls-va td-stg'
export environment_domains='.cl01.ca.us.workfront.com .cl01.ut.us.attask.com .cl01.va.us.attask.com -cl01.stg.ut.us.attask.com .cl02.ca.us.workfront.com .cl02.ut.us.attask.com .cl02.va.us.attask.com -cl02.stg.ut.us.attask.com .cl03.ca.us.workfront.com .cl03.ut.us.attask.com .cl03.va.us.attask.com -cl03.stg.ut.us.attask.com .crsb01.ca.us.workfront.com .crsb01.ut.us.attask.com .crsb02.ca.us.workfront.com .crsb02.ut.us.attask.com .prod.ut.us.attask.com .prod.va.us.attask.com .hub.ca.us.workfront.com .dot8.ut.us.attask.com .dot8.va.us.attask.com -dot8.stg.ut.us.attask.com -load.stg.ut.us.attask.com .mig.ut.us.attask.com .pvcl01.ca.us.workfront.com .pvcl02.ca.us.workfront.com .pvcl03.ca.us.workfront.com .sb01.ut.us.attask.com .sb02.ut.us.attask.com .sb03.ut.us.attask.com .scale.ut.us.attask.com .td.ca.us.workfront.com .td.ut.us.attask.com .td.va.us.attask.com -td.stg.ut.us.attask.com'

export hubca='hub.ca.us.workfront.com'
export HISTSIZE=100000000
bind '" ": magic-space'
#export JAVA_HOME=/usr/java/jdk1.7.0_60_x86
#export JAVA_HOME=/usr/java/latest
export JAVA_HOME=/usr/java/jdk1.8.0_65
export M2_HOME=/opt/maven
export M2=$M2_HOME/bin 
PATH=$M2:$PATH

#export HISTFILESIZE=100000000
#unset HISTSIZE
unset HISTFILESIZE
export HISTTIMEFORMAT="%F %T "

ANDROID_HOME=~/opt/android-studio/sdk
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

function saltDied {
SSH="ssh -tt -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o CheckHostIP=no"
for host in $@; do
		ping -c1 -W 3 $host 2>&1 > /dev/null && $SSH $host /usr/bin/sudo salt-call --local service.restart salt-minion
done
}
