#!/bin/sh

set -eu

# Load app arrays
DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
. "$DOTFILES/scripts/apps.sh"

# Update system
echo "[package installer] Updating system"
sudo pacman -Syu --noconfirm

# Install all apps
for pkg in $ALL_APPS; do
	if ! command -v "$pkg" >/dev/null 2>&1; then
		echo "[package installer] Installing $pkg"
		sudo pacman -S --noconfirm "$pkg"
	else
		echo "[package installer] $pkg is already installed"
	fi
done

echo "[package installer] Done"
