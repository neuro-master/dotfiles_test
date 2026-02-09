#!/bin/sh

DOTFILES="$(cd -- "$(dirname -- "$0")/.." && pwd -P)"

create_history_file() {
    local folder_name="$1"
    echo "Creating history file directory for $folder_name"
    mkdir -p "$XDG_STATE_HOME/$folder_name"
    touch "$XDG_STATE_HOME/$folder_name/${folder_name}_history"
}

echo "Setting up dotfiles for core packages"

for pkg in "${CORE_PKGS[@]}"; do
    case "$pkg" in
        zsh)
            create_history_file "zsh"
            ;;
        less)
            create_history_file "less"
            ;;
        vim)
            # ugh
            ;;
        git)
            # ugh
            ;;
        python)
            create_history_file "python"
            ;;
        *)
            echo "No dotfiles for $pkg"
            ;;
    esac
done

echo "Finished setting up dotfiles for core packages"
