#!/usr/bin/env bash
# Install this Neovim config into ~/.config/nvim, sync plugins, then open Neovim.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${INSTALL_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/nvim}"
REPO_URL="${REPO_URL:-https://github.com/alexesba/nvim-config.git}"
MIN_NVIM_VERSION="0.11.2"
BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*" >&2; }
err() { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; exit 1; }

version_ge() {
  # usage: version_ge 0.12.0 0.11.2
  [ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]
}

require_git() {
  if ! command -v git >/dev/null 2>&1; then
    err "git is required. Install git and re-run this script."
  fi
}

require_nvim() {
  if command -v nvim >/dev/null 2>&1; then
    local ver
    ver="$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n1)"
    if version_ge "$ver" "$MIN_NVIM_VERSION"; then
      return 0
    fi
    warn "Neovim $ver found; $MIN_NVIM_VERSION or newer is recommended."
    return 0
  fi

  info "Neovim not found. Attempting install..."
  case "$(uname -s)" in
    Darwin)
      command -v brew >/dev/null 2>&1 || err "Install Homebrew from https://brew.sh or install Neovim manually."
      brew install neovim
      ;;
    Linux)
      if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y neovim
      elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --needed neovim
      elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y neovim
      else
        err "Install Neovim manually, then re-run this script."
      fi
      ;;
    *)
      err "Unsupported OS. Install Neovim manually, then re-run this script."
      ;;
  esac
}

backup_existing() {
  if [[ -e "$INSTALL_DIR" || -L "$INSTALL_DIR" ]]; then
    local backup="${INSTALL_DIR}.bak.${BACKUP_SUFFIX}"
    info "Backing up existing config to $backup"
    mv "$INSTALL_DIR" "$backup"
  fi
}

install_from_local() {
  info "Linking $SCRIPT_DIR -> $INSTALL_DIR"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  ln -sfn "$SCRIPT_DIR" "$INSTALL_DIR"
}

install_from_remote() {
  info "Cloning $REPO_URL -> $INSTALL_DIR"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
}

sync_plugins() {
  info "Installing plugins (lazy.nvim sync)..."
  nvim --headless "+Lazy! sync" +qa
  info "Plugins installed."
}

open_nvim() {
  info "Opening Neovim..."
  exec nvim
}

main() {
  require_git
  require_nvim

  if [[ -f "$SCRIPT_DIR/init.lua" ]]; then
    backup_existing
    install_from_local
  else
    backup_existing
    install_from_remote
  fi

  sync_plugins
  open_nvim
}

main "$@"
