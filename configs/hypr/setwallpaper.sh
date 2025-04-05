#!/bin/env zsh

hyprctl hyprpaper unload all
# Sets a random wallpaper with swaybg

wallpapers=($(ls -d $HOME/.local/share/wallpapers/*.png))
wallpapers+=($(ls -d /usr/share/hypr/wall*))

wall=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}

hyprctl hyprpaper preload $wall
hyprctl hyprpaper wallpaper ,$wall

