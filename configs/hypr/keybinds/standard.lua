----------------------------------------------
--- file: keybinds/standard.lua
--- Author: Ming (mail@zyming.me)
---
--- This file contains keybindings defined for standard with no plugins
----------------------------------------------

local function setup_keybinds(vars)
	-- Basic Keybinds
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "RETURN", hl.dsp.exec_cmd(vars.terminal))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "C", hl.dsp.window.close())
	hl.bind(vars.mainMod .. " + " .. "M", hl.dsp.exit())
	hl.bind(vars.mainMod .. " + " .. "E", hl.dsp.exec_cmd(vars.fileManager))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "space", hl.dsp.window.float())
	hl.bind(vars.mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
	hl.bind(vars.mainMod .. " + " .. "P", hl.dsp.exec_cmd(vars.menu))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "V", hl.dsp.window.pseudo())

	-- dwindle
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "I", hl.dsp.layout("togglesplit"))

	-- executing command
	hl.bind(vars.mainMod .. " + " .. "D", hl.dsp.exec_cmd(vars.runmenu))

	-- Move focus with vars.mainMod + arrow keys
	hl.bind(vars.mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
	hl.bind(vars.mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
	hl.bind(vars.mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
	hl.bind(vars.mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

	-- Move focus with vars.mainMod + vim keys directions
	hl.bind(vars.mainMod .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
	hl.bind(vars.mainMod .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
	hl.bind(vars.mainMod .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
	hl.bind(vars.mainMod .. " + " .. "J", hl.dsp.focus({ direction = "down" }))

	-- swap windows around with arrows
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.window.swap({ direction = "left" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.window.swap({ direction = "right" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "up", hl.dsp.window.swap({ direction = "up" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "down", hl.dsp.window.swap({ direction = "down" }))

	-- swap windows around with vim keys
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "H", hl.dsp.window.swap({ direction = "left" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.window.swap({ direction = "right" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.window.swap({ direction = "up" }))
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.window.swap({ direction = "down" }))

	-- Resize Mode
	hl.bind(vars.mainMod .. " + " .. "R", hl.dsp.submap("resize"))

	local dirmap = {
		left = { x = -10, y = 0 },
		right = { x = 10, y = 0 },
		up = { x = 0, y = -10 },
		down = { x = 0, y = 10 },
	}

	local function resizeDir(key, dir)
		local xData = dirmap[dir].x
		local yData = dirmap[dir].y
		hl.bind(key, hl.dsp.window.resize({ x = xData, y = yData, relative = true }), { repeating = true })
	end

	-- defining a submap for resizing windows using
	-- Using both vimkeys and arros
	hl.define_submap("resize", function()
		-- Resize windows with arrows (relative=true => resizeactive-style relative resize)
		for _, key in ipairs({ "left", "right", "up", "down" }) do
			resizeDir(key, key)
		end

		-- Resize windows with vim keys
		for key, dir in pairs({ H = "left", L = "right", K = "up", J = "down" }) do
			resizeDir(key, dir)
		end
		hl.bind("escape", hl.dsp.submap("reset"))
	end)

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

	-- Changing workspace
	-- Also includes moving window to a certain workspace
	for i = 1, 10 do
		local key = i % 10 -- making sure i = 10 maps backs to 0
		hl.bind(vars.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(vars.mainMod .. " + " .. "SHIFT" .. " + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	-- Move current workspace to monitor

	-- TODO: manual review (unknown dispatcher: movecurrentworkspacetomonitor)
	hl.bind(vars.mainMod .. " + " .. "SHIFT" .. "+" .. "N", hl.dsp.workspace.move({ monitor = "+1" }))

	-- Example special workspace (scratchpad)
	hl.bind(vars.mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
	hl.bind(vars.mainMod .. " + " .. "ALT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

	-- Scroll through existing workspaces with vars.mainMod + scroll
	hl.bind(vars.mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(vars.mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	-- Move/resize windows with vars.mainMod + LMB/RMB and dragging
	hl.bind(vars.mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(vars.mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

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
