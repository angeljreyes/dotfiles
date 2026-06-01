hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Numix-Cursor-Light")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("GDK_SCALE", "1.2")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.exec_cmd("hyprctl setcursor Numix-Cursor-Light 24")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'")
