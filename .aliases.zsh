# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# --- Job control / history ---
alias h='history'
alias j='jobs -l'

# --- Git ---
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gco='git checkout'
alias gl="git log --oneline --graph --decorate --all --pretty=format:'%h %cd %d %s' --date=short"

# --- GCloud ---
alias gauth='gcloud auth login'
alias gproj='gcloud config set project a5a-s7e-k8s-tightbeam-dev'
alias gcompute='gcloud compute instances list'
alias gclusters='gcloud container clusters list'

# --- Grep ---
alias grep='grep --color=auto'

# --- File listing ---
if command -v exa &>/dev/null; then
  alias ls='exa --group-directories-first'
  alias ll='exa --group-directories-first --long --header --all --git'
  alias la='exa --group-directories-first --all'
  alias lt='exa --tree --level=2'
  alias lk='exa --long --sort=size --reverse'
else
  alias ls='ls --group-directories-first --color=auto'
  alias ll='ls --group-directories-first -lah'
  alias la='ls -A'
fi
