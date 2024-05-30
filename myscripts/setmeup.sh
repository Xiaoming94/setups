#!/bin/bash

# AUTHOR: Xiaoming94
# This is a script that automates my setups when i move to a PC
# Setting up things like oh-my-zsh, sway, and vim for minimal setups before this machine is up and running.
# Rightnow it only supports archlinux

MY_OS=ARCH
DESKTOP=${1:-sway}
echo "===== SETTING UP USER SPACE FOR $USER ON $MY_OS ====="

BASE_PKGLIST="zsh vim python xorg-xrdb feh imagemagick archey3"

case $DESKTOP in
    sway)
        BASE_PKGLIST=$BASE_PKGLIST" sway waybar kitty swaync network-manager-applet networkmanager"
        ;;
    gnome)
        BASE_PKGLIST=$BASE_PKGLIST" gnome gnome-extra"
        ;;
    kde)
        BASE_PKGLIST=$BASE_PKGLIST" plasma-meta plasma-wayland-session"
        ;;
    xfce)
        BASE_PKGLIST=$BASE_PKGLIST" xfce4 xfce4-goodies networkmanager network-manager-applet rofi dmenu xss-lock"
        ;;
    i3)
        BASE_PKGLIST=$BASE_PKGLIST" i3 rxvt-unicode dunst picom network-manager-applet networkmanager"
        ;;
    *)
        echo "The desktop you specified is not known to me"
        ;;
esac

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

# Installing packages and basic setup

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

# Setting up different components and symlinking configs
REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs
SCRIPTS_DIR=$REPO_ROOT/myscripts
cd $HOME

sh $SCRIPTS_DIR/setupvim.sh

# Setting up desktop
USER_CONFIG=$HOME/.config
mkdir -p $USER_CONFIG
ln -s $CONFIG_DIR/xresources.d $HOME/.xresources.d
ln -s $CONFIG_DIR/xresources $HOME/.xresources

mkdir -p $HOME/bin/myscripts # CREATING directory to put scripts etc
ln -s $REPO_ROOT/myscripts/* $HOME/bin/myscripts/

echo "===== Setting up desktop ====="
echo "If you are setting up an X11 desktop, remember to create an xinitrc"

case $DESKTOP in
    i3)
        echo "Setting up i3, remember to create an .xinitrc"
        ln -s $CONFIG_DIR/i3 $USER_CONFIG/i3
        ln -s $CONFIG_DIR/conky $USER_CONFIG/conky
        ln -s $CONFIG_DIR/picom $USER_CONFIG/picom
        ;;
    sway)
        echo "Setting up sway"
        ln -s $CONFIG_DIR/sway $USER_CONFIG/sway
        ln -s $CONFIG_DIR/waybar $USER_CONFIG/waybar
        ln -s $CONFIG_DIR/wofi $USER_CONFIG/wofi
        ;;
    *)
        echo "You are setting up something that is not sway or i3"
        ;;
esac
echo "===== Setting up zsh symlinks ===="
ln -s $CONFIG_DIR/zshenv $HOME/.zshenv
ln -s $CONFIG_DIR/zprofile $HOME/.zprofile
ln -s $CONFIG_DIR/myzshrc $HOME/.myzshrc

echo "===== installing oh-my-zsh ====="

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "SETUP_REPO=$REPO_ROOT" >> .zshrc       # Remember the config repo directory
echo "source ~/.myzshrc" >> .zshrc          # Sourcing personal config file

echo "ZSH and oh-my-zsh is setup and running, setup themes and plugins yourself"
echo "Any config should be done through .myzshrc"

