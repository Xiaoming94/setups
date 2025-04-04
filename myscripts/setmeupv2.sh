#!/bin/bash

# Author: Xiaoming94
# Set up script for archlinux

#########################
### ABOUT THIS SCRIPT ###
#########################

####
# This is a script I wrote to setup a basic archlinux user workspace
# This script is meant to replace the old setmeup.sh script
# Which was created during old times.
# The main difference being that now setting up zsh, vim, neovim and desktop
# were broken up into their own shell scripts.
####

##############################
### HOW TO USE THIS SCRIPT ###
##############################

####
# Honestly, just execute it and it will take care of the rest.
# Out of the box, this will just setup a zsh environment with default configurations,
# and setup both vim and neovim
# You can control this script through the variable
# - DESKTOP: selects a desktop to install
#   - If Unset, no desktop is installed (this is default)
#   - Otherwise, install the mentioned Desktop
#       - Supported values values: sway, hyprland, gnome, kde, xfce(4)
#
# - OMZ: Set this if you want OMZ (Unset by default)
# - SETUP_ANTIDOTE: Set up zsh antidote (Unset by default)
#
# All of these variables are meant to be used by the other 3 scripts that are sourced:
# - setupneovim.sh Sets up my neovim (and vim) configuration
# - setupdesktop.sh Installs the desktop based on $DESKTOP.
#   - Read the script to see how $DESKTOP is being used
# - setupmyzsh.sh Sets up a minimalistic zsh environment
#   - If OMZ is set, will install Oh-My-Zsh instead
#   - If SETUP_ANTIDOTE is set, will install Antidote plugin-manager
####


# Install base pkgs
echo "===== SETTING UP USER SPACE FOR $USER ON $MY_OS ====="

BASE_PKGLIST="zsh neovim vim python feh imagemagick fastfetch less man-db"

function installPackages () {
    echo "Installing basic packages"
    sudo pacman -Syu $BASE_PKGLIST --needed
    INSTALLED="installed"
}

function setupAur () {
    echo "Setting up for AUR"
    YAY_DIR_TEMP=$HOME/yayTemp
    mkdir $YAY_DIR_TEMP
    cd $YAY_DIR_TEMP
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg --syncdeps
    makepkg --clean
    cd $HOME
    rm -rf $YAY_DIR_TEMP
    AUR_SET="set"
}

REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs
SCRIPTS_DIR=$REPO_ROOT/myscripts

installPackages

if [ -z $INSTALLED  ]; then
    echo "You are probably not sudo, exiting";
    exit 1
fi

setupAur

if [ -z $AUR_SET ]; then
    echo "AUR install failed"
    exit 1
fi

echo "packages installed"

# Setting up vim, neovim, and zsh
cd $SCRIPTS_DIR

mkdir -p $HOME/.config
mkdir -p $HOME/bin/myscripts

# Setting up fastfetch config, cuz why not
ln -s $CONFIG_DIR/fastfetch $HOME/.config/fastfetch

source $SCRIPTS_DIR/setupneovim.sh

if [[ -n ${DESKTOP+x} ]]; then
    source $SCRIPTS_DIR/setupdesktop.sh
fi
source $SCRIPTS_DIR/setupmyzsh.sh

echo "All set, basic setup is done"
