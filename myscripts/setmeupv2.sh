#!/bin/bash

# Author: Xiaoming94
# Set up script for archlinux
# Installs basic console environment with zsh and vim+neovim along with 

# Then proceeds to setup a desktop

# Install base pkgs
echo "===== SETTING UP USER SPACE FOR $USER ON $MY_OS ====="

BASE_PKGLIST="zsh neovim vim python feh imagemagick fastfetch"

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
    makepkg --install
    makepkg --clean
    cd $HOME
    rm -rf $YAY_DIR_TEMP
    AUR_SET="set"
}

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
REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs
SCRIPTS_DIR=$REPO_ROOT/myscripts
cd $HOME

mkdir -p $HOME/.config
mkdir -p $HOME/bin/myscripts

# Setting up fastfetch config, cuz why not
ln -s $CONFIG_DIR/fastfetch $HOME/.config/fastfetch

source $SCRIPTS_DIR/setupneovim.sh
source $SCRIPTS_DIR/setupdesktop.sh
source $SCRIPTS_DIR/setupmyzsh.sh

echo "All set, basic setup is done"
