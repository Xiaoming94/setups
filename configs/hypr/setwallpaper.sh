#!/usr/bin/env zsh

# Sets a random wallpaper with hyprpaper
# (N) = nullglob, so a missing directory yields nothing instead of a literal glob
wallpapers=($HOME/.local/share/wallpapers/*.png(N) /usr/share/hypr/wall*(N))

(( $#wallpapers )) || { print -u2 "setwallpaper: no wallpapers found"; exit 1 }

wall=${wallpapers[ RANDOM % $#wallpapers + 1 ]}

hyprctl hyprpaper wallpaper ",$wall"
