# Load bashrc for bash login shells
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Function to add directory to PATH if it exists and isn't already there
add_to_path() {
    local new_path="$1"
    if [ -d "$new_path" ]; then
        case ":$PATH:" in
            *":$new_path:"*) ;; # Already in PATH
            *) PATH="$new_path:$PATH" ;;
        esac
    fi
}

# Load paths from .paths file
if [ -f "$HOME/.paths" ]; then
    while IFS= read -r line || [ -n "$line" ]; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue
        
        # Expand variables in the path
        eval "path_entry=\"$line\""
        add_to_path "$path_entry"
    done < "$HOME/.paths"
fi

# Ensure .local/bin is in PATH (fallback)
add_to_path "$HOME/.local/bin"

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