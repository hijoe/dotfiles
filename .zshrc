# Initialize Nix-managed tools
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
source <(fzf --zsh)

# Zsh enhancements (from Nix)
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Path additions
export PATH="$HOME/.bun/bin:$PATH"

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Key bindings - completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Aliases
alias reload='source ~/.zshrc'

# Git bare repo alias
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Directory listing aliases
alias lla='ls -la'
alias ll='ls -l'
alias la='ls -a'

# Utility aliases
alias ipi='curl ipinfo/ip'
alias rmf='rm -rf'
alias python='python3'

# Nix/Home Manager alias
alias hm='home-manager --flake ~/.config/nix'

# Homebrew management (keeping for now during transition)
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor; brew missing; echo "Brewskis finished" | terminal-notifier -sound default -appIcon https://brew.sh/assets/img/homebrew-256x256.png -title "Homebrew"'

# Load local environment if it exists
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
