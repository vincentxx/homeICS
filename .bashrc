# /etc/skel/.bashrc:
# $Header: /var/cvsroot/gentoo-src/rc-scripts/etc/skel/.bashrc,v 1.10 2004/09/29 04:13:33 agriffis Exp $
## 
# This file needs to have a .profile or .bash_profile in conjunction with it.

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

# uncomment the following to activate bash-completion:
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

###############################################################################
#
# Specific module account settings:
#
###############################################################################
source /opt/Modules/init/bash

module load ics-default

###############################################################################
#
# Variables
#
###############################################################################
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
        # Shell is non-interactive.  Be done now
	return
fi


#add the printer name!
#export PRINTER=name
#export LPRINTER=name

# history files
# change the size 
export HISTFILE="~/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=100000

# Change the window itle of X terminals 
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'

#case "$TERM" in
#	screen)
#		PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'
#		;;
#esac

#prompt
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
GREY="\[\033[01;30m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[01;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LGREY="\[\033[0;37m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"
NORMAL="\[\033[00m\]"

#PS1="${GREY}\u@\h ${GREEN}\t ${RED}\w \n\$ ${NORMAL}"
#comment this PS1 and use above if you want color
#PS1="\u@\h \t \w \n\$ "

#Vince color PS1
PS1="${GREY}# ${CYAN}\u${WHITE}@${GREEN}\h ${YELLOW}\w ${WHITE}[\t] \n${RED}\$${WHITE} "

# The default for PS2 is > which may be mistaken for a re-direct
export PS2="\\"

#General Settings
set noclobber
# Let me know when a background job has finished the moment it finishes.
set notify

# limit the core size to 1MB (2000 512-byte blocks)
ulimit -c 2000

# Make sure files are NOT world readable
umask 077

THEOS=`uname`
THEREV=`uname -r`
RUID=`/usr/[ub][ci][bn]/whoami`

###############################################################################
#
# Specific alias account settings:
# These aliases are for all operating systems
#
###############################################################################

#navigation
alias up="cd .."

#graphical
alias xterm="xterm -rv -sb &"

# 
alias s="suspend"
alias 1="fg %1"
alias 2="fg %2"

#ph alias'
alias pha="ph alias=\!* return all"
alias phn="ph name=\!* return all"
alias phe="ph ext=\!* return all"
alias phi="ph id=\!*"

###############################################################################
#
# Specific Linux settings:
#
###############################################################################

if test "$THEOS" == "Linux" ; then
	#settings
	# colors for ls, etc. 
		eval `dircolors -b /etc/DIR_COLORS`
	#aliases
	alias konsole="konsole --noxft"
	alias d="ls --color"
	alias cp="cp -iv"
	alias rm="rm -iv"
	alias mv="mv -iv"
	alias ls="ls -F --color=auto --human-readable --almost-all"
	alias ll="ls -l -F --color=auto --human-readable --almost-all"
	alias df="df -h"

###############################################################################
#
# Specific Solaris settings:
#
###############################################################################

elif test "$THEOS" == "SunOS" ; then
	#settings
	TERM=vt100
	#aliases
	alias ls="ls -F"
	alias ll="ls -la"
	alias cp="cp -i"
	alias mv="mv -i"
	alias rm="rm -i"
	alias reboot="echo Sure?"
fi

#Vince: append my tools
PATH=$PATH:/home/vuqt1/tools:.
export PATH

VIMRUNTIME="${HOME}/.vim"
export VIMRUNTIME

#klefstad CS141
module load gcc/5.4.0
module load gdb/7.12

