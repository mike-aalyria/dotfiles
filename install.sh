#!/bin/bash

# install.sh – Set up symlinks for dotfiles
# Usage: ./install.sh

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Symlink .zshrc
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Symlink aliases
ln -sf "$DOTFILES_DIR/.aliases.zsh" "$HOME/.aliases.zsh"

# Ensure ~/.config exists
mkdir -p "$CONFIG_DIR"

# Symlink Starship config
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$CONFIG_DIR/starship.toml"

echo "✅ Dotfiles installed and symlinked. Run 'source ~/.zshrc' to activate."

