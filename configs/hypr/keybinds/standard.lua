----------------------------------------------
--- file: keybinds/standard.lua
--- Author: Ming (mail@zyming.me)
---
--- This file contains keybindings defined for standard with no plugins
----------------------------------------------

local function setup_keybinds(vars)
	-- Basic Keybinds
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "RETURN", hl.dsp.exec_cmd(vars.terminal))
	hl.bind(vars.mainMod .. " + " .. "E", hl.dsp.exec_cmd(vars.fileManager))
	hl.bind(vars.mainMod .. " + " .. "P", hl.dsp.exec_cmd(vars.menu))
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
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute 0 toggle"))
	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("sh -c pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%"))
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("sh -c pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%"))
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))

	-- MISC Keybinds
	hl.bind(vars.mainMod .. " + " .. "CTRL" .. " + " .. "L", hl.dsp.exec_cmd("loginctl lock-session"))
end

return setup_keybinds
