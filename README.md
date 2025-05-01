# 🛠️ mike-aalyria / dotfiles

These are my personal dotfiles for setting up and configuring my development environments — focused primarily on my **remote gcloud Debian environment**, with lightweight compatibility on macOS.

The setup is designed to be minimal, fast, and portable across SSH, local terminal, and VSCode Remote.

---

## ✨ Features

✅ Zsh + Oh My Zsh configuration  
✅ Bash fallback configuration  
✅ Starship prompt setup  
✅ Shared `.aliases` for Bash and Zsh  
✅ Git configuration with aliases  
✅ `~/.local/bin` path management  
✅ Simple install + bootstrap scripts  
✅ Debian-optimized; Mac support is optional and minimal

---

## 📂 Repository structure

~/.dotfiles/
├── .bashrc             → Bash configuration
├── .zshrc              → Zsh + Oh My Zsh configuration
├── .gitconfig          → Git configuration and aliases
├── .profile            → Login shell configuration
├── .aliases            → Shared shell aliases
├── install.sh          → Main setup and symlink script
├── bootstrap.sh        → One-command bootstrap installer
└── config/
└── starship.toml   → Starship prompt configuration

---

## 🚀 Installation

### 🔧 On remote (Debian, gcloud, Linux server)

```bash
git clone https://github.com/mike-aalyria/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh

⚡ With bootstrap (recommended)

curl -sSL https://raw.githubusercontent.com/mike-aalyria/dotfiles/main/bootstrap.sh | bash



⸻

🖥️ On Mac (optional, minimal setup)

You can clone the repo on macOS if you want access to the configs, but no need to run the full install:

git clone https://github.com/mike-aalyria/dotfiles.git ~/.dotfiles



⸻

🔗 What gets set up

File	Purpose
~/.bashrc	Bash shell config
~/.zshrc	Zsh + Oh My Zsh config
~/.gitconfig	Git aliases and identity
~/.profile	Login shell config
~/.aliases	Shared aliases (used in Bash + Zsh)
~/.config/starship.toml	Starship prompt configuration
~/.local/bin/my-shell	Shell launcher script for Zsh fallback



⸻

⚙ Included tools
	•	Oh My Zsh — plugin manager for Zsh
	•	Starship — cross-shell prompt
	•	Zsh — improved shell over Bash
	•	Bash fallback — works if Zsh is missing

⸻

⚠ Notes
	•	Main target: Debian-based remote machines (gcloud, WSL, Linux servers)
	•	Mac usage: lightweight (for SSH, auth, or local commands only)
	•	Safe to rerun install.sh — it will update symlinks without breaking configs

⸻

🛡️ License

MIT License

⸻

💬 Contact

Created and maintained by Mike Aalyria

---
