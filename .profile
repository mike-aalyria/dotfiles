# Load bashrc for bash login shells
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

export EDITOR=nano

# Switch to zsh if available and not already running it
if [[ "$(ps -p $$ -o comm=)" != "zsh" ]] && command -v zsh >/dev/null 2>&1; then
    if [[ -x "$HOME/.local/bin/my-shell" ]]; then
        exec "$HOME/.local/bin/my-shell"
    else
        exec zsh
    fi
fi