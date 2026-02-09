#!/bin/sh

##### CUSTOM SETTINGS (See README.md for more details)

# XDG Locations (Define variables for current installation)
# These should later be exported in a shell startup script
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# General
UPDATE_BEFORE_INSTALL="yes"

# Gui Related
INSTALL_GUI="yes"
WINDOW_MANAGER="i3"
TERMINAL_EMULATOR="alacritty"
BROWSER="firefox"

INSTALL_LATEX_TOOLS="no"

INSTALL_FONTS="yes"
FONTS_LIST=("jetbrains_mono")

##### PACKAGES
CORE_PKGS=(zsh less vim gcc make git python)
#GUI_PKGS="xorg-server xorg-xinit i3-wm alacritty"
#WEB_PKGS="firefox"

#ALL_PKGS="$CORE_PKGS $GUI_PKGS $WEB_PKGS"
