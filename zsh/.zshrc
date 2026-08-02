# Skip p10k/oh-my-zsh in non-interactive shells (SSH commands etc.)
if [[ ! -o interactive ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  return 0
fi

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    "git"
    "sudo"
    "extract"
    "colored-man-pages"
    "z"
    "history-substring-search"
    "web-search"
    "docker"
    "docker-compose"
    "kubectl"
    "python"
    "node"
    "npm"
    "copyfile"
    "copypath"
    "jsontools"
    "dirhistory"
    "command-not-found"
    "fzf"
    "zoxide"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── PATH ──────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color

# ── Editor ────────────────────────────────────────────
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
fi

# ── Aliases ───────────────────────────────────────────
alias update="sudo dnf update -y && ~/.local/bin/update-wm.sh"
alias ports="sudo ss -tulanp"
alias myip="curl -s ifconfig.me"
alias localip="ip -brief addr"
alias disks="df -h"
alias mem="free -h"
alias services="systemctl list-units --type=service --state=running"
alias reload="source ~/.zshrc"
alias home="cd ~/"
alias portkill="sudo fuser -k -n tcp"
alias omniroute="HOSTNAME=0.0.0.0 omniroute"

# ── Modern ls/cat replacements ───────────────────────
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first"
alias la="eza -a --icons --group-directories-first"
alias lt="eza --tree --icons --level=2"
alias cat="bat --paging=never"
alias find="fd"

# ── zoxide (smarter cd) ───────────────────────────────
eval "$(zoxide init zsh)"

# ── NVM ───────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ── Qt theming ──────────────────────────────────────────
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
export ELECTRON_OZONE_PLATFORM_HINT=wayland
