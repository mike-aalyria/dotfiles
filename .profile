# ~/.profile - login shell environment setup

# Load bashrc for bash interactive shells
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue
        eval "path_entry=\"$line\""
        add_to_path "$path_entry"
    done < "$HOME/.paths"
fi

# Ensure common directories are in PATH
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/bin"

export PATH