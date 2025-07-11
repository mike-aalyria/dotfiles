# 🛠️ mike-aalyria / dotfiles

Personal dotfiles for setting up and configuring development environments on **Linux systems**. 


## 🚀 Quick Installation

```bash
curl -sSL https://raw.githubusercontent.com/mike-aalyria/dotfiles/main/bootstrap.sh | bash
```

## 📋 Manual Installation

```bash
git clone https://github.com/mike-aalyria/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## 🎯 What's Included

**Core Setup:**
- **Bash** as primary shell with advanced configuration
- **Modern command-line tools** with smart fallbacks
- **Centralized alias management** in `.aliases`
- **Centralized PATH management** in `.paths`
- **Centralized package management** in `.packages`
- **Environment setup** in `.profile`

**Enhanced Features:**
- Advanced history management (100k entries with timestamps)
- Colorized prompt with git branch info
- Modern alternatives to standard commands (`exa`, `bat`, `ripgrep`, `fzf`)
- Smart aliases that fallback to standard tools if modern ones aren't available
- Comprehensive aliases for git, system, and development
- Robust PATH management for custom tools
- Configurable package installation for Debian/Ubuntu systems

## 📂 Repository Structure

```
~/.dotfiles/
├── .bashrc          → Primary shell configuration
├── .profile         → Login shell environment (PATH, locale)
├── .aliases         → All shell aliases with modern tool integration
├── .paths           → Custom directories for PATH
├── .packages        → System packages to install
├── install.sh       → Installation and symlink script
├── bootstrap.sh     → Remote installation script
└── README.md        → This file
```

## 🔗 File Purposes

| File | Purpose | When It's Used |
|------|---------|----------------|
| `~/.profile` | Environment variables, PATH setup, locale | Login shells |
| `~/.bashrc` | Interactive shell config, prompt, history | Interactive shells |
| `~/.aliases` | Smart aliases with modern tool fallbacks | Sourced by .bashrc |
| `~/.paths` | Custom PATH directories | Processed by .profile |
| `~/.packages` | System packages to install | Read by install.sh |

## ⚙️ Key Features

### **Modern Command Replacements**
Smart aliases that use modern tools when available, with automatic fallbacks:

| Standard Command | Modern Alternative | What You Get |
|------------------|-------------------|-------------|
| `ls` | `exa` | Colors, icons, directory grouping |
| `cat` | `bat` | Syntax highlighting, line numbers |
| `grep` | `ripgrep` | Much faster searching |
| `find` | `fd` | Simpler syntax, faster results |
| `tree` | `exa --tree` | Better formatting |

### **Package Management**
Customize installed packages by editing `~/.packages`:
```bash
# === IMPROVED COMMAND LINE TOOLS ===
ripgrep          # rg - much faster grep alternative
fd-find          # fdfind - better find command
fzf              # fuzzy finder for files/history/commands
bat              # better cat with syntax highlighting
exa              # modern ls replacement with colors/icons

# === DEVELOPMENT TOOLS ===
tldr             # simplified man pages
jq               # JSON processor
git-delta        # better git diff viewer
```

### **PATH Management**
Add custom directories to your PATH by editing `~/.paths`:
```bash
# Add to ~/.paths
$HOME/my-tools
$HOME/.local/bin/custom
```

### **Smart Aliases**
Comprehensive aliases organized by category:

**Navigation & Files:**
- `..`, `...`, `....` - Navigate up directories
- `ll`, `la`, `l` - Directory listings (uses `exa` if available)
- `dsize` - Show directory sizes sorted by size

**Git Workflow:**
- `gs`, `ga`, `gc`, `gp`, `gl` - Git status, add, commit, push, pull
- `glog` - Beautiful git log with graph

**Development:**
- `fe` - Fuzzy find and edit files (requires `fzf`)
- `fh` - Fuzzy search command history
- `bashrc`, `aliases`, `profile` - Quick edit config files

**System & Network:**
- `df`, `du`, `free` - Human-readable system info
- `myip`, `localip` - Get IP addresses
- `psg` - Search processes

### **Git Integration**
- Git branch shown in prompt
- Comprehensive git aliases
- Colored output
- Optional `git-delta` for better diffs

### **Fuzzy Finding**
When `fzf` is installed, you get powerful fuzzy finding:
```bash
fe           # Fuzzy find and edit files
fh           # Fuzzy search command history
```

## 🖥️ System Requirements

- **Linux** (Debian/Ubuntu tested)
- **Bash** 4.0+
- **Git** (installed automatically)

## 🔄 Scripts Explained

### `bootstrap.sh`
- **Purpose:** Remote installation from GitHub
- **Use case:** Setting up new machines
- **What it does:** Clones repo and runs `install.sh`

### `install.sh`
- **Purpose:** Local installation and configuration
- **Use case:** Initial setup or updates
- **What it does:**
  - Reads and installs packages from `.packages`
  - Creates symlinks for all dotfiles
  - Sets up directories

## 🔧 Usage

### Initial Setup
```bash
# Run bootstrap for new machines
curl -sSL https://raw.githubusercontent.com/mike-aalyria/dotfiles/main/bootstrap.sh | bash

# Or clone and install manually
git clone https://github.com/mike-aalyria/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

### Managing Packages
```bash
# Edit package list
nano ~/.packages

# Add/remove packages as needed
# Uncomment optional tools you want
# Comment out tools you don't need

# Reinstall packages
cd ~/.dotfiles && ./install.sh
```

### Adding Custom Paths
```bash
echo '$HOME/my-tools' >> ~/.paths
source ~/.profile
```

### Adding Custom Aliases
```bash
echo "alias myalias='my command'" >> ~/.aliases
source ~/.bashrc
```

### Updating
```bash
cd ~/.dotfiles
git pull
./install.sh
```

## 🎨 Command Examples

After installation, familiar commands are enhanced:

```bash
# Enhanced file listing
ls              # Uses exa with colors and grouping
ll              # Detailed listing with exa
tree            # Directory tree with exa

# Better file viewing
cat file.txt    # Syntax highlighting with bat
less file.txt   # Paged viewing with bat

# Faster searching
grep "term" *   # Uses ripgrep for speed
find . -name "*.txt"  # Uses fd for better syntax

# Fuzzy finding (if fzf installed)
fe              # Fuzzy find and edit files
fh              # Fuzzy search command history

# Utility shortcuts
dsize           # Directory sizes sorted
myip            # Your external IP
psg firefox     # Search for firefox processes
```

## 💡 Smart Fallbacks

All modern tools have smart fallbacks:
- If `exa` isn't installed, `ls` uses standard `ls`
- If `bat` isn't installed, `cat` uses standard `cat`
- If `ripgrep` isn't installed, `grep` uses standard `grep`
- This ensures your dotfiles work on any system!

## 🛡️ License

MIT License

## 💬 Contact

Maintained by Mike Aalyria
