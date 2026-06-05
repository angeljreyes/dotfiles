hl.config({
	input = {
		kb_layout = "us(intl),us(altgr-intl)",
		kb_options = "ctrl:swapcaps",
		sensitivity = 0.2,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.4,
		},
	},
})

-- Don't swap caps on the evo75
hl.device({
	name = "rdmctmzt-evo75",
	kb_options = "",
})

hl.device({
	name = "evo75-bt2-keyboard",
	kb_options = "",
})

hl.device({
	name = "rdmctmzt-evo75-2.4g",
	kb_options = "",
})

hl.device({
	name = "msft0002:00-04f3:31ad-touchpad",
	sensitivity = 0.4,
	accel_profile = "adaptive",
})

hl.gesture({ fingers = 3, direction = "up", action = "float", mode = "tile" })
hl.gesture({ fingers = 3, direction = "down", action = "float", mode = "float" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "pinch", action = "fullscreen" })
hl.gesture({ fingers = 4, direction = "pinch", action = "resize" })
hl.gesture({ fingers = 4, direction = "swipe", action = "move" })
