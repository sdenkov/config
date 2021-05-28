#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Basic globbing and expansion stuff
GLOBIGNORE=".:.."
shopt -s dotglob
shopt -s progcomp_alias direxpand

# Check if we are running in an ssh session
export IS_SSH_SESSION=0
pstree -s $$ | grep -qe '-sshd-' && IS_SSH_SESSION=1

[[ -v IS_VNC_SESSION ]] || export IS_VNC_SESSION=0

# Set up colors
COLOR_RES='\[\e[0m\]'
if [[ $IS_SSH_SESSION -eq 1 || $IS_VNC_SESSION -eq 1 ]]
then
	COLOR_U_H='\[\e[0;32m\]'
	COLOR_PWD='\[\e[1;34m\]'
	COLOR_ERR='\[\e[0;31m\]'
else
	COLOR_U_H='\[\e[0;33m\]'
	COLOR_PWD='\[\e[1;34m\]'
	COLOR_ERR='\[\e[0;31m\]'
fi

function PS1_Get_Err
{
	local PS1_Err=$?
	if [[ $PS1_Err -ne 0 ]]
	then
		echo "{$PS1_Err}"
	fi
}

# Create themes
PS1_WINTITLE=""

case $TERM in
	xterm*)
		PS1_WINTITLE="\[\e]2;\u@\h: \w\007\]"
		;;
	*)
		;;
esac

PS1_LONG="\n$PS1_WINTITLE$COLOR_U_H\u@\h$COLOR_RES $COLOR_PWD\w$COLOR_RES ${COLOR_ERR}\$(PS1_Get_Err)${COLOR_RES}\n\\$ "
PS1_SHORT="$PS1_WINTITLE${COLOR_ERR}\$(PS1_Get_Err)${COLOR_RES}[$COLOR_U_H\u@\h$COLOR_RES $COLOR_PWD\W$COLOR_RES]\\$ "

eval $(dircolors)

# Clean up namespace
unset COLOR_RES
unset COLOR_U_H
unset COLOR_PWD
unset COLOR_ERR

# Prompt commands are usually crap
PROMPT_COMMAND=""

# Set up big history
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# More
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
PS1=$PS1_LONG

