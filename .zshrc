# ~/.zshrc – main Zsh config

# Source Oh My Zsh if installed
if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="robbyrussell"
    plugins=(git)

    source "$ZSH/oh-my-zsh.sh"
fi

# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Set up Starship prompt if installed
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"