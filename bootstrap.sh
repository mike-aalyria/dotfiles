#!/bin/bash

set -e

# Define target directory
DOTFILES_DIR="$HOME/.dotfiles"

# Clone the repo
if [ -d "$DOTFILES_DIR" ]; then
    echo "⚠️  $DOTFILES_DIR already exists. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
else
    echo "⬇️  Cloning dotfiles repository..."
    git clone https://github.com/mike-aalyria/dotfiles.git "$DOTFILES_DIR"
fi

# Run the installer
cd "$DOTFILES_DIR"
echo "🚀 Running install script..."
./install.sh

echo "✅ Bootstrap complete! Reload your shell or run: source ~/.bashrc"
