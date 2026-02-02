#!/usr/bin/env zsh

set -euo pipefail

# Load app arrays
DOTFILES="$(cd "$(dirname "${(%):-%N}")"/.. && pwd)"
source "$DOTFILES/scripts/apps.sh"

# Define XDG Environment variables (and set defaults if vars don't exist)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Create XDG base directories
mkdir -p "$XDG_CONFIG_HOME", "$XDG_CACHE_HOME", "$XDG_DATA_HOME", "$XDG_STATE_HOME"


install_apps() {
    local apps=("$@")
    for app in "${apps[@]}"; do
        case $app in
            zsh)
                echo "Installing zsh files (.zshenv, .zshrc, z.profile)"
                mkdir -p "$XDG_CONFIG_HOME/zsh"
                cp "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
                cp "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
                cp "$DOTFILES/zsh/.zprofile" "$XDG_CONFIG_HOME/zsh/.zprofile"
                ;;
            vim)
                echo "Creating vim state directories"
                VIM_STATE="$XDG_STATE_HOME/vim"
                mkdir -p "$VIM_STATE/swap" "$VIM_STATE/undo" "$VIM_STATE/backup"

                echo "Installing vimrc file"
                mkdir -p "$XDG_CONFIG_HOME/vim"
                cp "$DOTFILES/vim/vimrc" "$XDG_CONFIG_HOME/vim/vimrc"
                ;;
            git)
                echo "Installing git config file"
                mkdir -p "$XDG_CONFIG_HOME/git"
                cp "$DOTFILES/git/config" "$XDG_CONFIG_HOME/git/config"
                ;;
            *)
                echo "No dotfiles for $app"
                ;;
        esac
    done
}

install apps "${core_apps[@]}"
