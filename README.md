# 🛠️ mike-aalyria / dotfiles

Personal dotfiles for setting up and configuring my development environments — focused on **remote gcloud Debian** with lightweight macOS support.
The setup is minimal, fast, and portable across SSH, local terminals, and VSCode Remote.

## 🚀 Installation

### Quick Install (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/mike-aalyria/dotfiles/main/bootstrap.sh | bash
```

### Manual Install
```bash
git clone https://github.com/mike-aalyria/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## What's Included

Minimal but complete setup for remote development:
- Zsh with Oh My Zsh + Starship prompt
- Bash fallback configuration
- Git config with useful aliases
- Shared aliases for both shells
- Optimized for Debian with basic macOS support

## 📂 Repository structure

```
~/.dotfiles/
├── .bashrc           → Bash config
├── .zshrc            → Zsh + Oh My Zsh config
├── .gitconfig        → Git aliases + settings
├── .profile          → Login shell config
├── .aliases          → Shared Bash + Zsh aliases
├── install.sh        → Main setup + symlink script
├── bootstrap.sh      → One-line bootstrap installer
└── config/
    └── starship.toml → Starship prompt config
```

## 🔗 Setup summary

| File | Purpose |
|------|---------|
| ~/.bashrc | Bash config |
| ~/.zshrc | Zsh + Oh My Zsh config |
| ~/.gitconfig | Git aliases + identity |
| ~/.profile | Login shell config |
| ~/.aliases | Shared aliases |
| ~/.config/starship.toml | Starship prompt config |
| ~/.local/bin/my-shell | Shell launcher fallback |

## ⚙ Included tools

- Oh My Zsh — Zsh plugin manager
- Starship — cross-shell prompt
- Zsh — main shell
- Bash — fallback shell

## ⚠ Notes

- Target: Debian-based remote systems (gcloud, WSL, Linux servers)
- macOS: basic support (mainly for SSH and local use)
- Safe to rerun install.sh — it updates symlinks without breaking configs

## 🛡️ License

MIT License

## 💬 Contact

Maintained by Mike Aalyria
