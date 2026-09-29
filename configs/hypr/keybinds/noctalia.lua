----------------------------------------------
--- file: keybinds/noctalia.lua
--- Author: Ming (mail@zyming.me)
---
--- This file contains keybindings for running certain commands
--- in a standalone environment
----------------------------------------------
local function noctalia_ipc(command)
	return "noctalia msg " .. command
end

local function setup_keybinds(vars)
	-- Basic Keybinds
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "RETURN", hl.dsp.exec_cmd(vars.terminal))
	hl.bind(vars.mainMod .. " + " .. "E", hl.dsp.exec_cmd(vars.fileManager))
	hl.bind(vars.mainMod .. " + " .. "P", hl.dsp.exec_cmd(noctalia_ipc("panel-toggle launcher")))
	-- executing command
	hl.bind(vars.mainMod .. " + " .. "D", hl.dsp.exec_cmd(vars.runmenu))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.submap("screenshot"))

	hl.define_submap("screenshot", function()
		hl.bind(
			"Print",
			hl.dsp.exec_cmd(
				"grim ~/Pictures/$(date +%Y-%m-%d-%T)-screenshot.png && notify-send -t 2000 'screenshot taken'"
			)
		)
		hl.bind("Print", hl.dsp.submap("reset"))
		hl.bind("CONTROL" .. " + " .. "c", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
		hl.bind("CONTROL" .. " + " .. "c", hl.dsp.submap("reset"))
		hl.bind("escape", hl.dsp.submap("reset"))
	end)

	-- Volume and brightness control
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia_ipc("volume-mute")))
	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia_ipc("volume-up")))
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia_ipc("volume-down")))
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia_ipc("brightness-down")))
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia_ipc("brightness-up")))

	-- MISC Keybinds
	hl.bind(vars.mainMod .. " + " .. "CTRL" .. " + " .. "L", hl.dsp.exec_cmd(noctalia_ipc("session lock")))
end

return setup_keybinds
