local vars = require("modules.variables")

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")

	hl.exec_cmd("udiskie")
	hl.exec_cmd("playerctld")
	hl.exec_cmd("easyeffects --gapplication-service")

	hl.exec_cmd(vars.terminal)
	hl.exec_cmd("zen-browser")
	hl.exec_cmd("discord --use-gl=desktop")
	hl.exec_cmd("spotify-launcher")
	hl.exec_cmd("pano-scrobbler --minimized")

	hl.exec_cmd("hyprctl setcursor Numix-Cursor-Light 24")
	hl.exec_cmd("nwg-look -a")
end)
