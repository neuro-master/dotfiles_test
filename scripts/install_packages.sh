#!/bin/sh

set -eu

# Load app arrays
DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
. "$DOTFILES/scripts/packages.sh"

# Update system
echo "Updating system"
sudo pacman -Syu --noconfirm

# Install all apps
for pkg in $ALL_PKGS; do
    if ! pacman -Q "$pkg" >/dev/null 2>&1; then
        echo "Installing $pkg"
        sudo pacman -S --needed --noconfirm $pkg
    else
        echo "$pkg is already installed"
    fi
done

echo "Done"
