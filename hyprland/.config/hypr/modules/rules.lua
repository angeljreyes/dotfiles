local vars = require("modules.variables")

hl.workspace_rule({ workspace = "1", default_name = "dev", monitor = vars.main_monitor })
hl.workspace_rule({ workspace = "2", default_name = "web", monitor = vars.main_monitor })
hl.workspace_rule({ workspace = "3", default_name = "chat", monitor = vars.secondary_monitor })
hl.workspace_rule({ workspace = "4", default_name = "music", monitor = vars.main_monitor })
hl.workspace_rule({ workspace = "5", default_name = "game", monitor = vars.main_monitor, layout = "monocle" })
hl.workspace_rule({ workspace = "6", default_name = "tool", monitor = vars.main_monitor })
hl.workspace_rule({ workspace = "7", default_name = "misc", monitor = vars.main_monitor })

hl.window_rule({ match = { class = "com.github.hluk.copyq" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true })
hl.window_rule({ match = { class = "(zen|firefox) title:Picture-in-Picture" }, float = true })
hl.window_rule({ match = { class = "Rofi" }, pin = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, pin = true })
hl.window_rule({ match = { class = "blueman.*" }, pin = true })
hl.window_rule({ match = { class = "com.github.hluk.copyq" }, pin = true })
hl.window_rule({ match = { class = "(zen|firefox) title:Picture-in-Picture" }, pin = true })

hl.window_rule({ match = { class = "kitty" }, workspace = 1 })
hl.window_rule({ match = { class = "firefox" }, workspace = 2 })
hl.window_rule({ match = { class = "zen" }, workspace = 2 })
hl.window_rule({ match = { class = "discord" }, workspace = 3 })
hl.window_rule({ match = { class = "^[Ss]potify.*" }, workspace = 4 })
hl.window_rule({ match = { class = "tidal-hifi" }, workspace = 4 })
hl.window_rule({ match = { class = "luna" }, workspace = 4 })
hl.window_rule({ match = { class = "Modrinth-app" }, workspace = 5 })
hl.window_rule({ match = { class = "^Minecraft.*" }, workspace = 5 })
hl.window_rule({ match = { class = "steam" }, workspace = 5 })

hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
