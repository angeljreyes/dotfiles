local vars = require("modules.variables")

local main_mod = "SUPER"

local keys = function(...)
	return table.concat({ ... }, " + ")
end

-- Launch
hl.bind(keys(main_mod, "return"), hl.dsp.exec_cmd(vars.terminal))
hl.bind(keys(main_mod, "q"), hl.dsp.window.close())
hl.bind(keys(main_mod, "SHIFT", "q"), hl.dsp.window.kill())
hl.bind(keys(main_mod, "CTRL", "q"), hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(keys(main_mod, "v"), hl.dsp.exec_cmd("copyq show"))
hl.bind(keys(main_mod, "space"), hl.dsp.exec_cmd(vars.menu))
hl.bind(keys("ALT", "space"), hl.dsp.exec_cmd("fcitx5-remote --check && fcitx5-remote -e || fcitx5 -d"))
hl.bind(keys(main_mod, "ALT", "space"), hl.dsp.send_shortcut({ mods = "ALT", key = "space" }))
hl.bind(keys(main_mod, "CTRL", "c"), hl.dsp.exec_cmd("rofi -show calc -no-show-match -no-sort -theme calc"))
hl.bind(keys(main_mod, "p"), hl.dsp.exec_cmd("rofi -show power"))
hl.bind(keys(main_mod, "r"), hl.dsp.exec_cmd("hyprctl reload; killall waybar; waybar"))

-- Screenshot selection into clipboard
hl.bind("print", hl.dsp.exec_cmd("grimblast copy area --freeze"))
-- Screenshot current monitor into clipboard
hl.bind(keys("CTRL", "print"), hl.dsp.exec_cmd("grimblast copy output --freeze"))
-- Screenshot selection into editor
hl.bind(keys("SHIFT", "print"), hl.dsp.exec_cmd("grimblast save area - --freeze | swappy -f -"))
-- Paste image into editor
hl.bind(keys(main_mod, "SHIFT", "v"), hl.dsp.exec_cmd("wl-paste | swappy -f -"))

-- Cycle windows
hl.bind(keys(main_mod, "tab"), hl.dsp.layout("cyclenext"), { repeating = true })
hl.bind(keys(main_mod, "SHIFT", "tab"), hl.dsp.layout("cycleprev"), { repeating = true })

-- Move focus
hl.bind(keys(main_mod, "h"), hl.dsp.focus({ direction = "l" }), { repeating = true })
hl.bind(keys(main_mod, "l"), hl.dsp.focus({ direction = "r" }), { repeating = true })
hl.bind(keys(main_mod, "k"), hl.dsp.focus({ direction = "u" }), { repeating = true })
hl.bind(keys(main_mod, "j"), hl.dsp.focus({ direction = "d" }), { repeating = true })

-- Move windows
hl.bind(keys(main_mod, "SHIFT", "h"), hl.dsp.window.move({ direction = "l" }), { repeating = true })
hl.bind(keys(main_mod, "SHIFT", "l"), hl.dsp.window.move({ direction = "r" }), { repeating = true })
hl.bind(keys(main_mod, "SHIFT", "k"), hl.dsp.window.move({ direction = "u" }), { repeating = true })
hl.bind(keys(main_mod, "SHIFT", "j"), hl.dsp.window.move({ direction = "d" }), { repeating = true })

-- Switch workspaces
hl.bind(keys(main_mod, "a"), hl.dsp.focus({ workspace = 1 }))
hl.bind(keys(main_mod, "s"), hl.dsp.focus({ workspace = 2 }))
hl.bind(keys(main_mod, "d"), hl.dsp.focus({ workspace = 3 }))
hl.bind(keys(main_mod, "f"), hl.dsp.focus({ workspace = 4 }))
hl.bind(keys(main_mod, "z"), hl.dsp.focus({ workspace = 5 }))
hl.bind(keys(main_mod, "x"), hl.dsp.focus({ workspace = 6 }))
hl.bind(keys(main_mod, "c"), hl.dsp.focus({ workspace = 7 }))

-- Move active window to a workspace
hl.bind(keys(main_mod, "SHIFT", "a"), hl.dsp.window.move({ workspace = 1 }))
hl.bind(keys(main_mod, "SHIFT", "s"), hl.dsp.window.move({ workspace = 2 }))
hl.bind(keys(main_mod, "SHIFT", "d"), hl.dsp.window.move({ workspace = 3 }))
hl.bind(keys(main_mod, "SHIFT", "f"), hl.dsp.window.move({ workspace = 4 }))
hl.bind(keys(main_mod, "SHIFT", "z"), hl.dsp.window.move({ workspace = 5 }))
hl.bind(keys(main_mod, "SHIFT", "x"), hl.dsp.window.move({ workspace = 6 }))
hl.bind(keys(main_mod, "SHIFT", "c"), hl.dsp.window.move({ workspace = 7 }))

-- Move window border
local resize_amount = 20
hl.bind(keys(main_mod, "CTRL", "h"), hl.dsp.window.resize({ x = -resize_amount, y = 0 }), { repeating = true })
hl.bind(keys(main_mod, "CTRL", "j"), hl.dsp.window.resize({ x = 0, y = resize_amount }), { repeating = true })
hl.bind(keys(main_mod, "CTRL", "k"), hl.dsp.window.resize({ x = 0, y = -resize_amount }), { repeating = true })
hl.bind(keys(main_mod, "CTRL", "l"), hl.dsp.window.resize({ x = resize_amount, y = 0 }), { repeating = true })

-- Resize scrolling window
hl.bind(keys(main_mod, "CTRL", "minus"), hl.dsp.layout("colresize -conf"))
hl.bind(keys(main_mod, "CTRL", "equal"), hl.dsp.layout("colresize +conf"))

-- Move workspaces
hl.bind(keys(main_mod, "SHIFT", "w"), hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(keys(main_mod, "SHIFT", "e"), hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))

-- Scroll through existing workspaces
hl.bind(keys(main_mod, "mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(keys(main_mod, "mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows
hl.bind(keys(main_mod, "mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(keys(main_mod, "mouse:273"), hl.dsp.window.resize(), { mouse = true })
hl.bind(keys(main_mod, "mouse:274"), hl.dsp.window.float())

-- Multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("rofi -show calc -no-show-match -no-sort"))

-- Suspend when closing the lid
hl.bind("switch:on:Lid Switch", function()
	local behavior
	if Settings.lid_behavior == "auto" then
		behavior = #hl.get_monitors() == 1 and "sleep" or "nothing"
	else
		behavior = Settings.lid_behavior
	end

	if behavior == "sleep" then
		return hl.exec_cmd("hyprlock & disown && systemctl suspend")
	end
end, { locked = true })

hl.bind(keys(main_mod, "f11"), hl.dsp.window.fullscreen())
hl.bind(keys(main_mod, "u"), hl.dsp.window.float())
hl.bind(keys(main_mod, "i"), function()
	hl.dispatch(hl.dsp.window.float({ action = "float" }))
	hl.dispatch(hl.dsp.window.pin())
end)

---@param layout string
local switch_layout = function(layout)
	local workspace = hl.get_active_workspace()
	if workspace == nil then
		return
	end
	hl.workspace_rule({ workspace = tostring(workspace.id), layout = layout })
end

hl.bind(keys(main_mod, "1"), function() switch_layout("scrolling") end)
hl.bind(keys(main_mod, "2"), function() switch_layout("dwindle") end)
hl.bind(keys(main_mod, "3"), function() switch_layout("monocle") end)

hl.bind(keys(main_mod, "semicolon"), function() Settings() end)
