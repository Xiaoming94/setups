-----------------------------------------
--- file: vars.lua
--- Author: Ming
--- This file contains variables for items that are meant to be
--- globally accessible from within this hyprland configuration
--- Contains definition for things like
--- * Terminal
--- * File Manager
--- * Applications menu launcher
--- * Command launcher
--- * Default modifier for keybinds
--- So far these are only used in keybinds
-----------------------------------------

local term = "ghostty --working-directory=."

local vars = {
	-- terminal
	terminal = term,

	-- filemanager
	-- Could be anything that is not ranger too
	fileManager = term .. " -e ranger",

	-- Applications launcher
	menu = "j4-dmenu-desktop --dmenu='bemenu -i --binding vim' --term='ghostty'",

	-- Command executor
	runmenu = "bemenu-run",

	-- Main modifier
	mainMod = "SUPER",
}

return vars
