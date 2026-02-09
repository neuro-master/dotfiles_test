#!/bin/sh

set -eu

# Update system
if [ "$UPDATE_BEFORE_INSTALL" = "yes" ]; then
    echo "Updating system"
    sudo pacman -Syu --noconfirm
fi

# Install all packages in CORE_PKGS
echo "Installing core packages"

for pkg in "${CORE_PKGS[@]}"; do
    if pacman -Q "$pkg" >/dev/null 2>&1; then
        echo "$pkg is already installed"
    else
        echo "Installing $pkg"
        sudo pacman -S --needed --noconfirm "$pkg"
    fi
done

echo "Finished installing core packages"
