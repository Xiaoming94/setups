#!/bin/env zsh

hyprctl hyprpaper unload all
# Sets a random wallpaper with swaybg

wallpapers=($(ls -d $HOME/.local/share/wallpapers/*.png))
wallpapers+=($(ls -d /usr/share/hyprland/wall*))

wall=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}

hyprctl hyprpaper preload $wall
for monitor in $(hyprctl monitors | grep 'Monitor' | awk '{ print $2 }'); do
    hyprctl hyprpaper wallpaper "$monitor,$wall"
done
