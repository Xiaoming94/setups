----------------------------------------------
--- file: keybinds/noctalia.lua
--- Author: Ming (mail@zyming.me)
---
--- This file contains keybindings for running certain commands
--- in a standalone environment
----------------------------------------------
local function noctalia_ipc(command)
	local prefix = "noctalia msg "
	return hl.dsp.exec_cmd(prefix .. command)
end

local function noctalia_panel(command)
	return noctalia_ipc("panel-toggle " .. command)
end

local function setup_keybinds(vars)
	-- Basic Keybinds
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "RETURN", hl.dsp.exec_cmd(vars.terminal))
	hl.bind(vars.mainMod .. " + " .. "E", hl.dsp.exec_cmd(vars.fileManager))
	hl.bind(vars.mainMod .. " + " .. "P", noctalia_panel("launcher"))
	-- executing command
	hl.bind(vars.mainMod .. " + " .. "D", hl.dsp.exec_cmd(vars.runmenu))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.submap("screenshot"))

	hl.define_submap("screenshot", function()
		hl.bind("Print", noctalia_ipc("screenshot-fullscreen"))
		hl.bind("Print", hl.dsp.submap("reset"))
		hl.bind("CONTROL" .. " + " .. "c", noctalia_ipc("screenshot-region"))
		hl.bind("CONTROL" .. " + " .. "c", hl.dsp.submap("reset"))
		hl.bind("escape", hl.dsp.submap("reset"))
	end)

	-- Volume and brightness control
	hl.bind("XF86AudioMute", noctalia_ipc("volume-mute"))
	hl.bind("XF86AudioRaiseVolume", noctalia_ipc("volume-up"))
	hl.bind("XF86AudioLowerVolume", noctalia_ipc("volume-down"))
	hl.bind("XF86MonBrightnessDown", noctalia_ipc("brightness-down"))
	hl.bind("XF86MonBrightnessUp", noctalia_ipc("brightness-up"))

	-- MISC Keybinds
	hl.bind(vars.mainMod .. " + " .. "CTRL" .. " + " .. "L", noctalia_ipc("session lock"))
	hl.bind("ALT" .. " + " .. "TAB", noctalia_ipc("window-switcher"))
	hl.bind(vars.mainMod .. " + " .. "CTRL" .. " + " .. "SPACE", noctalia_panel("control-center"))
	hl.bind(vars.mainMod .. " + " .. "I", noctalia_panel("clipboard"))
end

return setup_keybinds
