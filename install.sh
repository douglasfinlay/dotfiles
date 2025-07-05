#!/usr/bin/env bash

set -euo pipefail

GREEN='\033[1;32m'
NC='\033[0m'
RED='\033[1;31m'
YELLOW='\033[1;33m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

check_required_tools() {
    local REQUIRED_TOOLS=(zsh rg tmux nvim)
    local missing_count=0

    echo -e "\nChecking installed tools..."
    for cmd in "${REQUIRED_TOOLS[@]}"; do
        if ! command -v "$cmd" &>/dev/null; then
            echo -e "${YELLOW}Missing tool: $cmd${NC}"
            missing_count=$((missing_count + 1))
        fi
    done

    if (( missing_count == 0)); then
        echo -e "${GREEN}All tools installed${NC}"
    fi
}

linked_count=0
skipped_count=0

print_summary() {
    if (( linked_count == 0)); then
        echo "Dotfiles already linked"
    else
        echo -e "\n${GREEN}$linked_count dotfile(s) linked${NC}"
    fi
}

link() {
    local src="$DOTFILES_DIR/$1"
    local dest="$HOME/$2"
    local short_src="${src/#$HOME/~}"
    local short_dest="${dest/#$HOME/~}"

    if [[ ! -e "$src" ]]; then
        echo -e "${RED}Target file does not exist: ${short_src}${NC}"
        return 0
    fi

    # Skip if already linked
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        skipped_count=$((skipped_count + 1))
        return 0
    fi

    mkdir -p "$(dirname "$dest")"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        set +e
        read -r -p "Overwrite $dest? [y/N] " confirm
        set -e

        case "$confirm" in
            [yY]|[yY][eE][sS])
                rm -rf "$dest"
                ;;
            *)
                echo -e "${YELLOW}Skipped $dest${NC}"
                return 0
                ;;
        esac
    fi

    ln -s "$src" "$dest"

    echo "Linked $short_src → $short_dest"
    linked_count=$((linked_count + 1))
}

link gitconfig      .gitconfig
link zprofile       .zprofile
link zshenv         .zshenv
link zshrc          .zshrc

link config/nvim    .config/nvim
link config/tmux    .config/tmux

print_summary
check_required_tools

