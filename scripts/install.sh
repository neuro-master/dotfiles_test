#!/bin/sh

set -eu

# Load config
. ./config.sh

# Create XDG base directories (defined in config.sh)
mkdir -p "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"

# Run installation files
. ./install_core.sh
. ./setup_core_dotfiles.sh
