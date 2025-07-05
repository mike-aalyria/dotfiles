# ~/.zprofile - sourced for zsh login shells
# Source .profile to ensure PATH and other login shell settings are applied
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile' 