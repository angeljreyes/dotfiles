local mocha = require("modules.mocha")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,
		border_size = 2,

		col = {
			active_border = { colors = { mocha.lavender, mocha.mauve }, angle = 45 },
			inactive_border = mocha.overlay0,
		},
	},

	decoration = {
		rounding = 10,
		shadow = {
			color = "rgba(00000060)",
			range = 50,
			offset = { 5, 10 },
			scale = 0.99,
			render_power = 2,
		},
		blur = {
			size = 6,
			passes = 2,
		},
	},

	group = {
		col = {
			border_active = mocha.peach,
			border_inactive = mocha.overlay0,
			border_locked_active = mocha.peach,
			border_locked_inactive = mocha.overlay0,
		},

		groupbar = {
			font_size = 16,
			text_color = mocha.text,
			col = {
				active = mocha.lavender,
				inactive = mocha.overlay0,
			},
		},
	},

	misc = {
		force_default_wallpaper = 0,
		font_family = "JetBrainsMono NF",
		focus_on_activate = false,
		middle_click_paste = false,
	},
})

hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.2,
	blur = true,
	blur_popups = true,
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("strong", { type = "spring", mass = 1.2, stiffness = 380, dampening = 35 })
hl.curve("soft", { type = "spring", mass = 0.8, stiffness = 240, dampening = 22 })

hl.animation({ leaf = "global", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "soft", style = "popin 75%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.49, spring = "soft" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, spring = "strong", style = "slidefade 20%" })
