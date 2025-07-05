# ~/.bashrc – minimal fallback configuration

# Only run if interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Enhanced history settings
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist
shopt -s lithist

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

# Add custom PATH
export PATH="$HOME/aalyria/minkowski/experimental/users/mcampanaro/tools:$PATH"

# Launch preferred shell (only once)
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi

# Launch preferred shell
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi

# Launch preferred shell
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi

# Launch preferred shell
if [[ ! "$SHELL" =~ "zsh" && -x "/home/mike_aalyria_com/.local/bin/my-shell" ]]; then
    exec "/home/mike_aalyria_com/.local/bin/my-shell"
fi
