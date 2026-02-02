#!/usr/bin/env zsh

set -euo pipefail

# Load app arrays
DOTFILES="$(cd "$(dirname "${(%):-%N}")"/.. && pwd)"
source "$DOTFILES/scripts/apps.h"

# Combine all arrays into one
packages=("${core_apps[@]}")

# Install all apps in packages array
for pkg in "${packages[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        echo "Installing $pkg"
        sudo pacman -S --noconfirm "$pkg"
    else
        echo "$pkg already installed"
    fi
done
