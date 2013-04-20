#!/bin/bash

alias github='br=$(git branch --contains HEAD | sed -rn "s/^\* //p"); if ! git ls-remote . | grep -q -e "refs/remotes/.*/${br}"; then br="master"; fi; xdg-open $(git config -l | sed -rn "s%remote.origin.url=git(@|://)(github.com)(:|/)(.+/.+).git%https://\2/\4/tree/${br}%p")'

# http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
#
# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# - If the input is a filename that exists, then it
#   uses the contents of that file.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [ "$USER" == "root" ]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if [ "$( tty )" == 'not a tty' ]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string or the contents of a file to the clipboard."
      echo "Usage: cb <string or file>"
      echo "       echo <string or file> | cb"
    else
      # If the input is a filename that exists, then use the contents of that file.
      if [ -e "$input" ]; then input="$(cat $input)"; fi
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

coinflip() {
	if [[ $(($RANDOM % 2)) -eq 1 ]]; then
		echo "Heads"
	else
		echo "Tails"
	fi
}

cp_p() {
   strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
      | awk '{
        count += $NF
            if (count % 10 == 0) {
               percent = count / total_size * 100
               printf "%3d%% [", percent
               for (i=0;i<=percent;i++)
                  printf "="
               printf ">"
               for (i=percent;i<100;i++)
                  printf " "
               printf "]\r"
            }
         }
         END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

extract() {
		if [ -f $1 ]; then
				case $1 in 
						*.tar.bz2)  tar xvjf $1 ;;
						*.tar.gz)   tar xvzf $1 ;;
						*.bz2)      bunzip2 $1 ;;
						*.rar)      unrar x $1 ;;
						*.gz)       gunzip $1 ;;
						*.tar)      tar xvf $1 ;;
						*.tbz2)     tar xvjf $1 ;;
						*.tgz)      tar xvzf $1 ;;
						*.zip)      unzip $1 ;;
						*.Z)        uncompress $1 ;;
						*.7z)       7z x $1 ;;
						*)          echo "'$1' cannot be extracted via extract" ;;
				esac
		else
				echo "'$1' is not a valid file"
		fi
}
# Borrowed from https://github.com/sagotsky/fd
# find directory and cd to it.  awesome for drupal modules with known names 8 dirs deep
function fd() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  while read line ;do
    dirs+=("$line")
  done < <(find ./ -type d -name "$SEARCH" 2>/dev/null | sort)

  case ${#dirs[@]} in
    0)
      false
      ;;
    1) 
      pushd "${dirs[@]}"
      ;;
    *)
      select dir in "${dirs[@]}" ; do
        pushd "$dir"
        break
      done
      ;;
  esac
}

# _fd borrowed from /etc/bash_completion's _cd
# _fd_filedir borrowed from /etc/bash_completion's_filedir, but
# uses find instead of compgen to get several directories deep
_fd()
{
    local cur IFS=$'\t\n' i j k
    _get_comp_words_by_ref cur

    # try to allow variable completion
    if [[ "$cur" == ?(\\)\$* ]]; then
        COMPREPLY=( $( compgen -v -P '$' -- "${cur#?(\\)$}" ) )
        return 0
    fi

    # Enable -o filenames option, see Debian bug #272660
    compgen -f /non-existing-dir/ >/dev/null

    # Use standard dir completion if no CDPATH or parameter starts with /,
    # ./ or ../
    if [[ -z "${CDPATH:-}" || "$cur" == ?(.)?(.)/* ]]; then
        _fd_filedir -d
        return 0
    fi

    local -r mark_dirs=$(_rl_enabled mark-directories && echo y)
    local -r mark_symdirs=$(_rl_enabled mark-symlinked-directories && echo y)

    # we have a CDPATH, so loop on its contents
    for i in ${CDPATH//:/$'\t'}; do
        # create an array of matched subdirs
        k="${#COMPREPLY[@]}"
        for j in $( compgen -d $i/$cur ); do
            if [[ ( $mark_symdirs && -h $j || $mark_dirs && ! -h $j ) && ! -d ${j#$i/} ]]; then
                j="${j}/"
            fi
            COMPREPLY[k++]=${j#$i/}
        done
    done

    _fd_filedir -d

    if [[ ${#COMPREPLY[@]} -eq 1 ]]; then
        i=${COMPREPLY[0]}
        if [[ "$i" == "$cur" && $i != "*/" ]]; then
            COMPREPLY[0]="${i}/"
        fi
    fi

    return 0
}


_fd_filedir()
{
    local i IFS=$'\t\n' xspec

    __expand_tilde_by_ref cur

    local -a toks
    local quoted tmp

    _quote_readline_by_ref "$cur" quoted
  
    FIND_LIMIT=150
    dirs=$(find ./ -name "${cur}*" -type d -printf '%f\n' -nowarn 2>/dev/null | head -n $FIND_LIMIT) 
    echo -e "\ndirs: $dirs\n"  >> /tmp/comp.log

    toks=( ${toks[@]-} $(
        #compgen -d -- "$quoted" | {
        echo "$dirs" | {
            while read -r tmp; do
                printf '%s\n' $tmp
            done
        }
    ))

    # On bash-3, special characters need to be escaped extra.  This is
    # unless the first character is a single quote (').  If the single
    # quote appears further down the string, bash default completion also
    # fails, e.g.:
    #
    #     $ ls 'a&b/'
    #     f
    #     $ foo 'a&b/<TAB>  # Becomes: foo 'a&b/f'
    #     $ foo a'&b/<TAB>  # Nothing happens
    #
    if [[ "$1" != -d ]]; then
        xspec=${1:+"!*.$1"}
        if [[ ${cur:0:1} == "'" && ${BASH_VERSINFO[0]} -ge 4 ]]; then
            toks=( ${toks[@]-} $(
                eval compgen -f -X \"\$xspec\" -- $quoted
            ) )
        else
            toks=( ${toks[@]-} $(
                compgen -f -X "$xspec" -- $quoted
            ) )
        fi
        if [ ${#toks[@]} -ne 0 ]; then
            # If `compopt' is available, set `-o filenames'
            compopt &>/dev/null && compopt -o filenames ||
            # No, `compopt' isn't available;
            # Is `-o filenames' set?
            [[ (
                ${COMP_WORDS[0]} && 
                "$(complete -p ${COMP_WORDS[0]})" == *"-o filenames"*
            ) ]] || {
                # No, `-o filenames' isn't set;
                # Emulate `-o filenames'
                # NOTE: A side-effect of emulating `-o filenames' is that
                #       backslash escape characters are visible within the list
                #       of presented completions, e.g.  the completions look
                #       like:
                #
                #           $ foo a<TAB>
                #           a\ b/  a\$b/
                #
                #       whereas with `-o filenames' active the completions look
                #       like:
                #
                #           $ ls a<TAB>
                #           a b/  a$b/
                #
                for ((i=0; i < ${#toks[@]}; i++)); do
                    # If directory exists, append slash (/)
                    if [[ ${cur:0:1} != "'" ]]; then
                        [[ -d ${toks[i]} ]] && toks[i]="${toks[i]}"/
                        if [[ ${cur:0:1} == '"' ]]; then
                            toks[i]=${toks[i]//\\/\\\\}
                            toks[i]=${toks[i]//\"/\\\"}
                            toks[i]=${toks[i]//\$/\\\$}
                        else
                            toks[i]=$(printf %q ${toks[i]})
                        fi
                    fi
                done
            }
        fi
    fi

    COMPREPLY=( "${COMPREPLY[@]}" "${toks[@]}" )
} # _filedir()

complete -F _fd fd

findclass() {
	if [ $# == 2 ]
	then
		find "$1" -name "*.jar" -exec sh -c 'jar -tf {}|grep -H --label {} '$2'' \;
	else
		find "." -name "*.jar" -exec sh -c 'jar -tf {}|grep -H --label {} '$1'' \;
	fi
}

githubclone() {
	git clone git@github.com:$1/$2.git && cd $2
}

mkcd() {
		if [ $# != 1 ]; then
				echo "Usage: mkcd <dir>"
		else
				mkdir -p $1 && cd $1
						fi
}

netscan() {
		ip=$(ifconfig | grep "inet addr" | awk -F" " '{print $2}' | head -1 | awk -F":" '{print $2}' | awk -F"." '{print $1 "." $2 "." $3 ".0"}')
		nmap -sP ${ip}/24
}

passgen() {
    echo $(< /dev/urandom tr -dc A-Za-z0-9_ | head -c$1)
}

seconds2days() { # convert integer seconds to Ddays,HH:MM:SS
		printf "%ddays,%02d:%02d:%02d" $(((($1/60)/60)/24)) \
		$(((($1/60)/60)%24)) $((($1/60)%60)) $(($1%60)) |
		sed 's/^1days/1day/;s/^0days,\(00:\)*//;s/^0//' ; }

stripcolors() {
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
}

sortbytype(){
	for ext in $( find . -type f | grep -o '\.[^./]*$' | sort | uniq -i); do
   		echo -n "${ext} "
			find . -iname "*${ext}" -exec du -b {} + | awk 'BEGIN { size=0; count=0 } { size+=$1; count++ } END { print count, size }'
	done
}

up() { 
    if [ $# != 1 ]; then
				echo "Usage: $0 <count>"
		else
				[ $(( $1 + 0 )) -gt 0 ] && cd $(eval "printf '../'%.0s {1..$1}"); 
		fi
}

vimscp() {
		vim scp://$1//$2
}

vimssh() {
		vimscp $@
}

whatip() {
    if [ $# != 1 ]; then
        echo "Usage: $0 <ip address>"
    else
        nslookup $1 | grep Add | grep -v '#' | cut -f 2 -d ' '
    fi
}

wiki() {
	dig +short txt $1.wp.dg.cx
}

xmurder(){
	WINDOW_ID=`xwininfo | grep "Window id:" | awk '{print $4}'`
	PROCESS_ID=`xprop -id $WINDOW_ID _NET_WM_PID | awk '{print $3}'`
	kill -9 $PROCESS_ID
}
