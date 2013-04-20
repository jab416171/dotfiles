#!/bin/bash
#notify-send --icon=utilities-terminal-symbolic -t 50 "Stashing"
git status --porcelain | grep -E "^?M" > /dev/null
GREP_STATUS=$?
if [ $GREP_STATUS -ne 1 ]; then
		git stash
fi
#notify-send --icon=utilities-terminal-symbolic -t 50 "Pulling"
git pull --rebase
#notify-send --icon=utilities-terminal-symbolic -t 50 "Unstashing"
if [ $GREP_STATUS -ne 1 ]; then
		git stash pop
fi
