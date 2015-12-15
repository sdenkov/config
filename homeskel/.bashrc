#
# ~/.bashrc
#

# Check if we are running in an ssh session
IS_SSH=0
pstree -s $$ | grep -qe '-sshd-' && IS_SSH=1

# Set up colors
COLOR_RES='\[\e[0m\]'
if [[ IS_SSH -eq 1 ]]
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
	PS1_Err=$?
	if [[ $PS1_Err -eq 0 ]]
	then
		PS1_Err=
	else
		PS1_Err="{$PS1_Err}"
	fi
}

# Create themes
PROMPT_COMMAND=PS1_Get_Err
PS1_LONG="\n$COLOR_U_H\u@\h$COLOR_RES $COLOR_PWD\w$COLOR_RES ${COLOR_ERR}\${PS1_Err}${COLOR_RES}\n\$ "
PS1_SHORT="${COLOR_ERR}\${PS1_Err}${COLOR_RES}[$COLOR_U_H\u@\h$COLOR_RES $COLOR_PWD\W$COLOR_RES]\$ "
function ps1_long
{
	PS1=$PS1_LONG
}

function ps1_short
{
	PS1=$PS1_SHORT
}

alias ps1_default=ps1_long

# Clean up namespace
unset IS_SSH
unset COLOR_RES
unset COLOR_U_H
unset COLOR_PWD
unset COLOR_ERR


# Continue

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
ps1_default
