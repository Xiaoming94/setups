# Defining some standard keybinds I know I'll always want

# Searching history with vim keys and arrows
bindkey "^K" up-line-or-history # Up
bindkey "^J" down-line-or-history # Down

# Searching from history with already typed line with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Open editor to edit command instead of directly in the prompt
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
