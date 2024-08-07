#!/bin/env zsh

# Sets a random wallpaper with swaybg

wallpapers=($(ls -d $HOME/.local/share/wallpapers/*.png))
wallpapers+=($(ls -d /usr/share/hyprland/wall*))

wall=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}

swaybg -m fill -i $wall -o \* -c "#112a4a" &

