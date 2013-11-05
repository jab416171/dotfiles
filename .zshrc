# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=1000000
setopt appendhistory autocd beep extendedglob nomatch notify sharehistory hist_expire_dups_first hist_reduce_blanks prompt_subst 
bindkey -e
bindkey ' ' magic-space

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zmodload zsh/complist
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

bindkey -M listscroll q send-break

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:-command-:*:(commands|builtins|reserved-words|aliases)' group-name commands
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:messages' format %d
zstyle ':completion:*:warnings' format 'No matches for '%d
zstyle ':completion:*:descriptions' format %B%d%b
if [ -r ~/.zshaliases ]; then
		. ~/.zshaliases
fi
if [ -f ~/src/liquidprompt/liquidprompt ]; then
		. ~/src/liquidprompt/liquidprompt
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
TRAPALRM() {
	print -nP "\e]2;%T\a"
	TMOUT=30
}
TMOUT=30
export PS1='%(?..%?)[%B%*%b] %n:%5~ %# '
