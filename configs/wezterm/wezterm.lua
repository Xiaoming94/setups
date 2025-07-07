-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.term = "wezterm"

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- appearance stuff
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 10
config.color_scheme = 'Aci (Gogh)'

config.window_background_opacity = 0.95

-- Hide Tabs
config.hide_tab_bar_if_only_one_tab = true


-- Finally, return the configuration to wezterm:
return config
