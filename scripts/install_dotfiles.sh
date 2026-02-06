#!/bin/sh

set -eu

# Load app arrays
DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
. "$DOTFILES/scripts/packages.sh"

# Define XDG Environment variables (and set defaults if vars don't exist)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Create XDG base directories
mkdir -p "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"

# Install necessary dotfiles for each app
for app in $ALL_PKGS; do
    case $app in
        zsh)
            echo "Creatin zsh history file directory"
            mkdir -p "$XDG_STATE_HOME/zsh"
            touch "$XDG_STATE_HOME/zsh/zsh_history"

            echo "Installing zsh files (.zshenv, .zshrc, .zprofile)"
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
        python)
            echo "Creating python history file directory"
            mkdir -p "$XDG_STATE_HOME/python"
            touch "$XDG_STATE_HOME/python/python_history"
            ;;
        xorg-server)
            echo "Creating xorg directories"
            mkdir -p "$XDG_STATE_HOME/xorg"
            ;;
        xorg-xinit)
            echo "Installing xinitrc file"
            mkdir -p "$XDG_CONFIG_HOME/xinit"
            cp "$DOTFILES/xinit/xinitrc" "$XDG_CONFIG_HOME/xinit/xinitrc"
            ;;
        i3-wm)
            echo "Installing i3 config"
            mkdir -p "$XDG_CONFIG_HOME/i3"
            cp "$DOTFILES/i3/config" "$XDG_CONFIG_HOME/i3/config"
            ;;
        alacritty)
            echo "Installing alacritty config"
            mkdir -p "$XDG_CONFIG_HOME/alacritty"
            cp "$DOTFILES/alacritty/alacritty.toml" "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
            ;;
        *)
            echo "No dotfiles for $app"
            ;;
    esac
done

# Some other necessary dotfiles/directories (to align with my .zshenv)

# History files
echo "Creating less history file directory"
mkdir -p "$XDG_STATE_HOME/less"
touch "$XDG_STATE_HOME/less/less_history"

# Fonts
cp -r "$DOTFILES/fonts" "$XDG_DATA_HOME"

echo "Finished installing dotfiles"
