-----------------------------------------
--- File: rules/apps.lua
--- Author: Ming (Xiaoming)
-----------------------------------------
--- This file is for defining rules for how certain application windows should be placed
--- This includes locking apps to certain workspaces etc.
--- To change the workspace behaviours, go to workspaces.lua

--------------------
--- APPLICATIONS ---
--------------------
hl.window_rule({
	name = "apply_to_webbrowsers",
	match = {
		class = "(firefox|[C|c]hromium)",
	},
	workspace = 2,
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	name = "suppress_maximize",
	match = {
		class = "*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "move_chat_to_4",
	match = {
		class = "discord",
	},
	workspace = 4,
})

hl.window_rule({
	name = "move_keepass_to_6",
	match = {
		class = "^(org\\.keepassxc\\.KeePassXC)$",
	},
	workspace = 6,
})

----------------------------------
--- Game specific window rules ---
----------------------------------

-- Genshin impact
hl.window_rule({
	name = "genshin-multi-monitor-lock",
	match = {
		class = "steam_proton",
		title = "Genshin Impact",
	},
	allows_input = true,
	immediate = true,
	confine_pointer = true, -- <--- Hard-blocks mouse from leaving onto adjacent screens
})
