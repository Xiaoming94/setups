#!/bin/bash

# Author: Xiaoming
# Setting up a desktop with wayland or X11 to use


REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs
SCRIPTS_DIR=$REPO_ROOT/myscripts

USER_CONFIG=$HOME/.config
MY_SCRIPTS_PATH=$HOME/bin/myscripts

function setupterminal () {
    TERM_APP=$1;
    echo "===== Setting up $TERM_APP ====="

    sudo pacman -S --needed $TERM_APP
    ln -s $CONFIG_DIR/$TERM_APP $USER_CONFIG/$TERM_APP
}

function setupxresources () {
    sudo pacman -S --needed xorg-xrdb
    ln -s $CONFIG_DIR/xresources.d $HOME/.xresources.d
    ln -s $CONFIG_DIR/xresources $HOME/.xresources
}

function installfonts () {
    echo "===== installing some fonts ====="
    sudo pacman -S --needed $(cat $CONFIG_DIR/fonts.txt)
}

function setupwaybar () {
    sudo pacman -S --needed swaync waybar
    ln -s $CONFIG_DIR/waybar $USER_CONFIG/waybar
}

function setuphyprland () {
    sudo pacman -S --needed hyprland hypridle hyprpaper hyprlock hyprpolkitagent
    ln -s $CONFIG_DIR/hypr $USER_CONFIG/hypr
    ln -s $SCRIPTS_DIR/hyprboot $MY_SCRIPTS_PATH
}

function setupsway () {
    sudo pacman -S --needed sway swaylock swaybg swayidle
    ln -s $CONFIG_DIR/sway $USER_CONFIG/sway
    ln -s $SCRIPTS_DIR/swaystartup $MY_SCRIPTS_PATH
    ln -s $SCRIPTS_DIR/swayslock $MY_SCRIPTS_PATH
}

function installnetworkmanager () {
    echo "Installing and enabling NetworkManager"
    sudo pacman -S --needed networkmanager network-manager-applet
    sudo systemctl enable NetworkManager --now
}

function setupaudio () {
    echo "Setting up Pipewire"
    sudo pacman -S --needed pipewire pavucontrol pipewire-pulse alsa-utils
}

DESKTOP=${DESKTOP:-hyprland}

setupxresources
setupterminal() wezterm
installfonts
setupaudio
installnetworkmanager

echo "Installing desktop $DESKTOP"

case $DESKTOP in
    sway)
        setupsway
        setupwaybar
        ;;
    hyprland)
        setuphyprland
        setupwaybar
        ;;
    gnome)
        sudo pacman -S --needed gnome gnome-extra
        ;;
    plasma)
        sudo pacman -S --needed plasma-meta plasma-wayland-session kde-applications-meta
        ;;
    xfce | xfce4)
        sudo pacman -S --needed xfce4 xfce4-goodies networkmanager network-manager-applet xss-lock
        ;;

esac

