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
- **Modern command-line tools** that replace standard commands
- **Centralized alias management** in `.aliases`
- **Centralized PATH management** in `.paths`
- **Centralized package management** in `.packages`
- **Environment setup** in `.profile`

**Enhanced Features:**
- Advanced history management (100k entries with timestamps)
- Colorized prompt with git branch info
- Modern alternatives to standard commands (`exa`, `batcat`, `ripgrep`, `fzf`)
- Direct aliases that use enhanced tools (requires packages to be installed)
- Comprehensive aliases for git, system, and development
- Robust PATH management for custom tools
- Configurable package installation for Debian/Ubuntu systems

## 📂 Repository Structure

```
~/.dotfiles/
├── .bashrc          → Primary shell configuration
├── .profile         → Login shell environment (PATH, locale)
├── .aliases         → Modern tool aliases (requires packages)
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
| `~/.aliases` | Modern tool aliases (requires packages) | Sourced by .bashrc |
| `~/.paths` | Custom PATH directories | Processed by .profile |
| `~/.packages` | System packages to install | Read by install.sh |

## ⚙️ Key Features

### **Modern Command Replacements**
Direct aliases that use modern tools:

| Standard Command | Modern Tool | What You Get |
|------------------|-------------|--------------|
| `ls` | `exa` | Colors, icons, directory grouping |
| `cat` | `batcat` | Syntax highlighting, line numbers |
| `grep` | `ripgrep` | Much faster searching |
| `find` | `fd` | Simpler syntax, faster results |
| `tree` | `exa --tree` | Better formatting |

**Note:** These aliases require the modern tools to be installed. Run `./install.sh` to install all required packages.

### **Package Management**
Required packages are defined in `.packages`:
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
```

### **PATH Management**
Add custom directories to your PATH by editing `~/.paths`:
```bash
# Add to ~/.paths
$HOME/my-tools
$HOME/.local/bin/custom
```

### **Aliases**
Comprehensive aliases organized by category:

**Navigation & Files:**
- `..`, `...`, `....` - Navigate up directories
- `ll`, `la`, `l` - Directory listings with `exa`
- `dsize` - Show directory sizes sorted by size
- `tree` - Directory tree with `exa`

**Enhanced Commands:**
- `cat`, `less`, `more` - File viewing with `batcat`
- `grep`, `fgrep`, `egrep` - Searching with `ripgrep`
- `find` - File finding with `fd`

**Git Workflow:**
- `gs`, `ga`, `gc`, `gp`, `gl` - Git status, add, commit, push, pull
- `glog` - Beautiful git log with graph

**Development:**
- `fe` - Fuzzy find and edit files
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

### **Fuzzy Finding**
Powerful fuzzy finding with `fzf`:
```bash
fe           # Fuzzy find and edit files
fh           # Fuzzy search command history
```

## 🖥️ System Requirements

- **Linux** (Debian/Ubuntu tested)
- **Bash** 4.0+
- **Modern CLI tools** (installed automatically via `.packages`)

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

After installation, commands use modern tools:

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

# Fuzzy finding
fe              # Fuzzy find and edit files
fh              # Fuzzy search command history

# Utility shortcuts
dsize           # Directory sizes sorted
myip            # Your external IP
psg firefox     # Search for firefox processes
```

## ⚠️ Important Notes

- **Modern tools required**: Aliases expect `exa`, `batcat`, `ripgrep`, `fzf`, and `fd-find` to be installed
- **Run `./install.sh`** to install all required packages
- **No fallbacks**: If packages are missing, commands may fail until installed
- This ensures consistent behavior and maximum performance

## 🛡️ License

MIT License

## 💬 Contact

Maintained by Mike Aalyria
