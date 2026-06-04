#!/usr/bin/env bash
# Install this Neovim config into ~/.config/nvim, sync plugins, then open Neovim.
#
# Install modes:
#   clone  — git clone into ~/.config/nvim
#   link   — symlink this repo (any path) to ~/.config/nvim
#   ready  — repo is already at ~/.config/nvim; only sync plugins (auto-detected)
#
# Examples:
#   curl -fsSL .../install.sh | bash
#   git clone ... ~/.config/nvim && cd ~/.config/nvim && ./install.sh
#   git clone ... ~/Projects/nvim-config && cd $_ && ./install.sh
set -euo pipefail

INSTALL_DIR="${INSTALL_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/nvim}"
REPO_URL="${REPO_URL:-https://github.com/alexesba/nvim-config.git}"
REPO_BRANCH="${REPO_BRANCH:-master}"
INSTALL_SCRIPT_URL="${INSTALL_SCRIPT_URL:-https://raw.githubusercontent.com/alexesba/nvim-config/${REPO_BRANCH}/install.sh}"
INSTALL_MODE="${INSTALL_MODE:-}"
MIN_NVIM_VERSION="0.11.2"
BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*" >&2; }
err() { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; exit 1; }

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]:-install.sh}") [clone|link]

Install modes:
  clone   Clone the repo into ${INSTALL_DIR}
  link    Symlink this repo to ${INSTALL_DIR} (when cloned outside ${INSTALL_DIR})
  ready   Auto: repo already lives at ${INSTALL_DIR} — only syncs plugins

Examples:
  curl -fsSL ${INSTALL_SCRIPT_URL} | bash
  git clone -b ${REPO_BRANCH} ${REPO_URL} ${INSTALL_DIR} && cd ${INSTALL_DIR} && ./install.sh
  git clone -b ${REPO_BRANCH} ${REPO_URL} ~/Projects/nvim-config && cd ~/Projects/nvim-config && ./install.sh

Environment:
  INSTALL_DIR         Target config path (default: ~/.config/nvim)
  REPO_URL            Git clone URL for clone mode
  REPO_BRANCH         Git branch to clone (default: ${REPO_BRANCH})
  INSTALL_SCRIPT_URL  Raw install.sh URL for curl (derived from REPO_BRANCH)
  INSTALL_MODE        clone | link (same as the argument)
  MAPLEADER           Leader key (non-interactive installs; default: ,)
  FORCE_LEADER        Set to 1 to re-prompt even if leader.local.lua exists
EOF
}

version_ge() {
  [ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]
}

can_link_local() {
  local src="${BASH_SOURCE[0]:-}"
  [[ -n "$src" && -f "$src" ]] || return 1
  local dir
  dir="$(cd "$(dirname "$src")" && pwd)"
  [[ -f "$dir/init.lua" ]]
}

local_repo_dir() {
  cd "$(dirname "${BASH_SOURCE[0]}")" && pwd
}

resolve_install_dir() {
  if [[ -e "$INSTALL_DIR" || -L "$INSTALL_DIR" ]]; then
    (cd "$INSTALL_DIR" && pwd -P)
  else
    echo "$(cd "$(dirname "$INSTALL_DIR")" && pwd)/$(basename "$INSTALL_DIR")"
  fi
}

# True when this repo is already Neovim's config path (clone into ~/.config/nvim).
already_configured() {
  can_link_local || return 1
  [[ "$(local_repo_dir)" == "$(resolve_install_dir)" ]]
}

resolve_mode() {
  local arg="${1:-}"

  case "$arg" in
    -h | --help | help)
      usage
      exit 0
      ;;
    clone | link | ready)
      echo "$arg"
      return 0
      ;;
    "")
      ;;
    *)
      err "Unknown option: $arg (use: clone | link). Run with --help for usage."
      ;;
  esac

  if [[ -n "$INSTALL_MODE" ]]; then
    case "$INSTALL_MODE" in
      clone | link) echo "$INSTALL_MODE"; return 0 ;;
      *) err "INSTALL_MODE must be 'clone' or 'link' (got: $INSTALL_MODE)" ;;
    esac
  fi

  if can_link_local; then
    if already_configured; then
      echo "ready"
    else
      echo "link"
    fi
  else
    echo "clone"
  fi
}

require_git() {
  command -v git >/dev/null 2>&1 || err "git is required. Install git and re-run this script."
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

install_clone() {
  info "Mode: clone — installing into $INSTALL_DIR"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone --depth 1 --branch "$REPO_BRANCH" "$REPO_URL" "$INSTALL_DIR"
}

install_link() {
  can_link_local || err "link mode must be run from a clone of this repo (init.lua not found next to install.sh)."

  if already_configured; then
    info "Mode: ready — repo is already at $INSTALL_DIR"
    return 0
  fi

  local dir
  dir="$(local_repo_dir)"
  info "Mode: link — symlink $dir -> $INSTALL_DIR"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  ln -sfn "$dir" "$INSTALL_DIR"
}

install_ready() {
  info "Mode: ready — config already at $INSTALL_DIR, skipping backup/link"
}

config_root() {
  if can_link_local; then
    local_repo_dir
  else
    echo "$INSTALL_DIR"
  fi
}

escape_lua_string() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  printf '%s' "$s"
}

configure_leader() {
  local root leader_file
  root="$(config_root)"
  leader_file="$root/lua/config/leader.local.lua"
  mkdir -p "$(dirname "$leader_file")"

  if [[ -f "$leader_file" && -z "${FORCE_LEADER:-}" ]]; then
    info "Using existing leader.local.lua (set FORCE_LEADER=1 to choose again)"
    return
  fi

  local leader="${MAPLEADER:-,}"
  if [[ -t 0 && -z "${MAPLEADER:-}" ]]; then
    printf "Leader key for <leader> maps [default: ,]: "
    IFS= read -r leader || true
    leader="${leader:-,}"
  fi

  local escaped
  escaped="$(escape_lua_string "$leader")"
  cat >"$leader_file" <<EOF
-- Generated by install.sh — edit or delete to change <leader>
vim.g.mapleader = "$escaped"
EOF
  info "Leader key saved to lua/config/leader.local.lua"
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
  local mode arg="${1:-}"
  mode="$(resolve_mode "$arg")"

  if [[ "$mode" == "clone" ]] && already_configured; then
    warn "Repo is already at $INSTALL_DIR; using ready mode instead of clone"
    mode="ready"
  fi

  if [[ -z "$arg" && -z "$INSTALL_MODE" ]]; then
    case "$mode" in
      ready) info "Repo is already at $INSTALL_DIR — finishing setup (plugin sync)" ;;
      link) info "Local repo detected — using link mode (symlink to $INSTALL_DIR)" ;;
      clone) info "No local repo detected — using clone mode" ;;
    esac
  else
    info "Install mode: $mode"
  fi

  require_git
  require_nvim

  case "$mode" in
    ready)
      install_ready
      ;;
    *)
      backup_existing
      case "$mode" in
        clone) install_clone ;;
        link) install_link ;;
      esac
      ;;
  esac

  configure_leader
  sync_plugins
  open_nvim
}

main "$@"
