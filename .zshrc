# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Disable default Oh My Zsh themes (we use Starship)
# ZSH_THEME="robbyrussell"

# Load plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load custom aliases
[ -f "$HOME/.aliases.zsh" ] && source "$HOME/.aliases.zsh"

# VS Code detection
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  export IN_VSCODE=true
fi

# GCP cloud host detection
if grep -qEi \"(Google|Cloud)\" /sys/class/dmi/id/sys_vendor 2>/dev/null; then
  export IS_GCLOUD_ENV=true
fi

# Starship prompt
eval \"$(starship init zsh)\"
