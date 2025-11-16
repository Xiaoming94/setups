#### Initializing Config ####
#
# Source standard configurations
# init.zsh are the common stuff
#
#############################

ZSH_CONFIG_DIR="$HOME/.zshrc.d"
source "$ZSH_CONFIG_DIR/init.zsh"

# Vim bindings in zsh
bindkey -v

#### Custom and local aliases here ####

#### Set the theme ####
#
# Default theme is ming
# To see available themes, run '$ prompt -l'

themename="ming"
loadtheme "$themename"
