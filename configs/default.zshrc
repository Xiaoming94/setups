ZDOTDIR=$HOME/.zshrc.d
 
# Source standard configurations
source $ZDOTDIR/init.zsh

if [[ $PROMPT_THEME == "powerlevel10k" ]]; then
    loadp10k
fi

# Vim bindings in zsh
bindkey -v

