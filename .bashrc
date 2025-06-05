# ~/.bashrc – minimal fallback configuration

# Only run if interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Basic history
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Check window size after commands
shopt -s checkwinsize

# Basic prompt
PS1='\u@\h:\w\$ '

# Load aliases if available
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Basic completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
fi
# Launch preferred shell
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi

# Launch preferred shell
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi
