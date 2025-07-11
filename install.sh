#!/bin/bash

set -e

# === CONFIG ===
DOTFILES_DIR="$HOME/.dotfiles"
LOCAL_BIN="$HOME/.local/bin"

# === HELPER FUNCTIONS ===
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

read_packages() {
    local packages_file="$1"
    local packages=()
    
    if [ -f "$packages_file" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            # Skip lines that start with # or are empty
            [[ "$line" =~ ^[[:space:]]*# ]] && continue
            [[ -z "${line// }" ]] && continue
            
            # Extract package name (everything before # comment)
            package=$(echo "$line" | sed 's/#.*//' | xargs)
            
            # Skip if package name is empty after removing comments
            [[ -z "$package" ]] && continue
            
            packages+=("$package")
        done < "$packages_file"
    fi
    
    printf '%s\n' "${packages[@]}"
}

install_packages() {
    echo "📦 Installing packages..."
    
    if command_exists apt-get; then
        echo "Using apt package manager..."
        sudo apt-get update
        
        # Read packages from .packages file
        PACKAGES_FILE="$DOTFILES_DIR/.packages"
        if [ -f "$PACKAGES_FILE" ]; then
            echo "Reading packages from $PACKAGES_FILE"
            PACKAGES=($(read_packages "$PACKAGES_FILE"))
            
            if [ ${#PACKAGES[@]} -eq 0 ]; then
                echo "⚠️  No packages found in $PACKAGES_FILE"
                return
            fi
            
            echo "Found ${#PACKAGES[@]} packages to install..."
            for pkg in "${PACKAGES[@]}"; do
                if ! dpkg -s "$pkg" >/dev/null 2>&1; then
                    echo "Installing $pkg..."
                    if sudo apt-get install -y "$pkg" 2>/dev/null; then
                        echo "✅ $pkg installed successfully"
                    else
                        echo "⚠️ $pkg not available in repositories (skipped)"
                    fi
                else
                    echo "⏭️ $pkg already installed (skipped)"
                fi
            done
        else
            echo "⚠️  Package file not found: $PACKAGES_FILE"
            echo "Creating default package file..."
            
            # Create default .packages file if it doesn't exist
            cat > "$PACKAGES_FILE" << 'EOF'
# Default packages
bash
bash-completion
curl
git
nano
EOF
            echo "📝 Edit $PACKAGES_FILE to customize package list"
        fi
    else
        echo "⚠️  apt not found. Please install packages manually from .packages file"
    fi
}

create_symlinks() {
    echo "🔗 Creating symlinks..."
    
    # Ensure dotfiles directory exists
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "❌ Dotfiles directory not found: $DOTFILES_DIR"
        exit 1
    fi
    
    # Create symlinks for dotfiles
    FILES=".profile .bashrc .aliases .paths .packages"
    for file in $FILES; do
        if [ -f "$DOTFILES_DIR/$file" ]; then
            echo "Symlinking $file"
            ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
        else
            echo "⚠️  File not found: $DOTFILES_DIR/$file"
        fi
    done
}

setup_directories() {
    echo "📁 Setting up directories..."
    mkdir -p "$LOCAL_BIN"
    mkdir -p "$HOME/.config"
}

# === MAIN EXECUTION ===
echo "🚀 Starting dotfiles installation..."

install_packages
setup_directories 
create_symlinks

echo ""
echo "✅ Dotfiles setup complete!"
echo "📝 Run 'source ~/.bashrc' or open a new terminal to apply changes"
echo "📦 To modify packages, edit ~/.packages and re-run install.sh"

