# ~/.bashrc – primary shell configuration

# Only run if interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# History settings
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
shopt -s histappend
shopt -s checkwinsize
shopt -s cmdhist

# Environment
export EDITOR='nano'
export VISUAL='nano'
export LESS='-R -i -M -S -x4'
export LESSHISTFILE='-'

# Colors
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    RED='\[\033[0;31m\]'
    GREEN='\[\033[0;32m\]'
    YELLOW='\[\033[1;33m\]'
    BLUE='\[\033[0;34m\]'
    RESET='\[\033[0m\]'
else
    RED='' GREEN='' YELLOW='' BLUE='' RESET=''
fi

# Git prompt function
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt
PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${YELLOW}\$(git_branch)${RESET}\$ "

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Enable bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Source local customizations
[ -f ~/.bashrc.local ] && source ~/.bashrc.local