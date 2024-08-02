#### Setting $ZDOTDIR ####
ZDOTDIR=$HOME/.zshrc.d
 
#### Set the theme ####
#
# Default theme is ming
# To see available themes, run '$ prompt -l'

#PROMPT_THEME=ming

#### Initializing Config ####
# Source standard configurations

source $ZDOTDIR/init.zsh

if [[ $PROMPT_THEME == "powerlevel10k" ]]; then
    loadp10k
fi

# Vim bindings in zsh
bindkey -v

