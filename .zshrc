# ~/.zshrc – primary shell configuration

# Environment variables
export PATH="$HOME/.local/bin:$PATH"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nano"

# Terminal configuration
case "$TERM" in
    xterm-256color|screen-256color|xterm-color|vscode*) 
        export TERM="xterm-256color"
        ;;
esac

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Directory navigation
setopt AUTO_CD              # Just type directory name to cd
setopt AUTO_PUSHD          # Make cd push old dir onto dir stack
setopt PUSHD_IGNORE_DUPS   # No duplicates in dir stack
setopt PUSHD_SILENT        # No dir stack after pushd/popd
setopt EXTENDED_GLOB       # Extended globbing. Allows using regular expressions with *

# Completion system
autoload -Uz compinit
compinit

# Git completion for aliases
# if [[ -n "$ZSH_VERSION" ]]; then
#     # Load git completion if not already loaded
#     if ! type _git > /dev/null 2>&1; then
#         autoload -Uz _git
#         _git
#     fi
    
#     # Define git completion for aliases
#     compdef _git gs=git-status
#     compdef _git ga=git-add
#     compdef _git gc=git-commit
#     compdef _git gp=git-push
#     compdef _git gd=git-diff
# fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
setopt COMPLETE_ALIASES

# Better directory colors
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Useful functions
python_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        local version=$(python -V 2>&1 | cut -d' ' -f2)
        echo " (py:${version})"
    fi
}

git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    [[ -n "$branch" ]] && echo " (${branch})"
}

# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# Clean, efficient prompt configuration
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$(python_info)$(git_branch)%# '

# Load syntax highlighting if available
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load autosuggestions if available
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

COMMON_PACKAGES=(zsh curl tldr micro git fzf ripgrep)