# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
if [ -r ~/.zshaliases ]; then
		. ~/.zshaliases
fi

# The function will not be run in future, but you can run
# it yourself as follows:
# autoload -Uz zsh-newuser-install
# zsh-newuser-install -f
# 
# The code added to ~/.zshrc is marked by the lines
# Lines configured by zsh-newuser-install
# # End of lines configured by zsh-newuser-install
# You should not edit anything between these lines if you intend to
# run zsh-newuser-install again.  You may, however, edit any other part
# of the file.
#
