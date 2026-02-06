# Interactive Shell Config


# Zsh History Config
HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Other Application Histories
LESSHISTFILE="$XDG_STATE_HOME/less/less_history"
PYTHON_HISTORY="$XDG_STATE_HOME/python/python_history"

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
alias la='ls -A'

# Prompt
autoload -Uz promptinit
promptinit
prompt walters
