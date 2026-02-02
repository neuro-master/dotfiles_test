# Interactive Shell Config


# History
HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Completion System
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Basic shell options
setopt beep nomatch
unsetopt autocd extendedglob notify
bindkey -v

# Custom aliases
alias ls='ls --color=auto'
alias ll='ls -lah'

# Prompt
autoload -Uz promptinit
promptinit
prompt walters
