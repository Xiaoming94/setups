----------------------------------------------
--- file: keybinds/standard_nav.lua
--- Author: Ming (mail@zyming.me)
---
--- This file contains navigation buttons without plugins.
--- Designed to work independent of desktop shell
----------------------------------------------

local function setup_keybinds(mainMod)
	-- Basic Keybinds
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "C", hl.dsp.window.close())
	hl.bind(mainMod .. " + " .. "M", hl.dsp.exit())
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "space", hl.dsp.window.float())
	hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "V", hl.dsp.window.pseudo())

	-- dwindle
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "I", hl.dsp.layout("togglesplit"))

	-- Move focus with mainMod + arrow keys
	hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

	-- Move focus with mainMod + vim keys directions
	hl.bind(mainMod .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + " .. "J", hl.dsp.focus({ direction = "down" }))

	-- swap windows around with arrows
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.window.swap({ direction = "left" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.window.swap({ direction = "right" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "up", hl.dsp.window.swap({ direction = "up" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "down", hl.dsp.window.swap({ direction = "down" }))

	-- swap windows around with vim keys
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "H", hl.dsp.window.swap({ direction = "left" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.window.swap({ direction = "right" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.window.swap({ direction = "up" }))
	hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.window.swap({ direction = "down" }))

	-- Resize Mode
	hl.bind(mainMod .. " + " .. "R", hl.dsp.submap("resize"))

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

	-- Changing workspace
	-- Also includes moving window to a certain workspace
	for i = 1, 10 do
		local key = i % 10 -- making sure i = 10 maps backs to 0
		hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	-- Move current workspace to monitor

	-- TODO: manual review (unknown dispatcher: movecurrentworkspacetomonitor)
	hl.bind(mainMod .. " + " .. "SHIFT" .. "+" .. "N", hl.dsp.workspace.move({ monitor = "+1" }))

	-- Example special workspace (scratchpad)
	hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
	hl.bind(mainMod .. " + " .. "ALT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

	-- Scroll through existing workspaces with mainMod + scroll
	hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
end

return setup_keybinds
