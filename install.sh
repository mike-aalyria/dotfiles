#!/bin/bash

set -e

# === CONFIG ===
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
LOCAL_BIN="$HOME/.local/bin"

# === HELPER FUNCTIONS ===
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

ensure_local_bin() {
    mkdir -p "$LOCAL_BIN"
    if [[ ":$PATH:" != *":$LOCAL_BIN:"* ]]; then
        export PATH="$LOCAL_BIN:$PATH"
    fi
}

install_packages() {
    echo "📦 Installing required packages..."

    ensure_local_bin

    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command_exists brew; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install zsh starship
    elif command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y zsh curl

        if ! command_exists starship; then
            curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir="$LOCAL_BIN" -y
        fi
    fi

    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

create_symlinks() {
    echo "🔗 Creating symlinks..."

    ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    ln -sf "$DOTFILES_DIR/.profile" "$HOME/.profile"
    ln -sf "$DOTFILES_DIR/.aliases" "$HOME/.aliases"

    mkdir -p "$CONFIG_DIR"
    ln -sf "$DOTFILES_DIR/config/starship.toml" "$CONFIG_DIR/starship.toml"
}

setup_shell_launcher() {
    echo "🐚 Setting up shell launcher..."
    SHELL_LAUNCHER="$LOCAL_BIN/my-shell"
    cat > "$SHELL_LAUNCHER" << 'EOF'
#!/bin/bash
if command -v zsh >/dev/null 2>&1; then
    exec zsh
else
    echo "Zsh not found, falling back to current shell"
    exec "$SHELL"
fi
EOF
    chmod +x "$SHELL_LAUNCHER"

    if ! grep -q "exec $SHELL_LAUNCHER" "$HOME/.bashrc"; then
        echo -e "\n# Launch preferred shell\nif [[ ! \"\$SHELL\" =~ \"zsh\" && -x \"$SHELL_LAUNCHER\" ]]; then\n    exec \"$SHELL_LAUNCHER\"\nfi" >> "$HOME/.bashrc"
    fi
}

# === MAIN RUN ===
install_packages || true
create_symlinks
setup_shell_launcher

echo -e "\n✅ Dotfiles setup complete!"
echo "➡️ Run 'source ~/.bashrc' or open a new terminal to start using your setup."