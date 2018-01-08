#!/bin/bash

# ~/.bashrc skeleton
# ~/.bashrc runs ONLY on non-login subshells! (different from ksh)
# add lines here very carefully as this may execute when you don't i
# expect them to
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#echo "BASHRC has run"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# if chimera generated aliases exist, pull them into the current ENV
[ -f ~/.bbalias ] && . ~/.bbalias

export LS_COLORS="ow=01;90:di=01;90:fi=34:ex=33"
alias ls='ls --color=auto'


use_colour=true
#alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
#if __git_ps1 > /dev/null 2>&1; then gitps1="__git_ps1"; else gitps1=":"; fi


if ${use_colour}; then
    # If root
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]root@\h\[\033[01;34m\] \w#\[\033[00m\] '
    else
        PS1='\[\033[1;36m\]\h:\[\033[;34m\] \w \[\033[;90m$($gitps1)\]\[\033[01;34m\]\$\[\033[00m\] '
    fi
#else
#    PS1='\u@\h \w$(__git_ps1)\$ '
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# commandline editing
set -o emacs    # emacs style command line mode (default)
#set -o vi      # vi style command line mode

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# this variable needs to be set for pnewtask/pnewscript to function
# if you don't know what to put here leave it alone or ask your team.
#GROUP=put_your_group_here

alias ew='/home/pshepher/bin/eclipse_wizard.py'

alias xtermbig='xterm -fn "-*-courier-medium-r-normal--18-*-*-*-*-*-*-*" &'

alias ee='emacs -nw'
alias ..='cd ..'
alias rm=rm


alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias .....='\cd ../../../..'

alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
alias cl='clear'
alias fg='fg %'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias l='ls -1A'
alias la='ll -a'
alias ll='ls -la --group-directories-first'

alias ee='emacs -nw'
alias arc='/home/phab/bin/arc'
alias cppcheck='/opt/swt/bin/cppcheck'

# bb specific
alias hist='ls -l /proc/self/fd' # see last 3 command run history
alias usage='fsusage'

export EDITOR="emacs -nw"

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37;41'

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# zsh hist search not applicable
set -o emacs
alias __A=$(print '\0020') # ^P = up = previous command
alias __B=$(print '\0016') # ^N = down = next command
alias __C=$(print '\0006') # ^F = right = forward a character
alias __D=$(print '\0002') # ^B = left = back a character
alias __H=$(print '\0001') # ^A = home = beginning of line
stty erase ^?

# jump around directories https://github.com/rupa/z
# source ~/z.sh
