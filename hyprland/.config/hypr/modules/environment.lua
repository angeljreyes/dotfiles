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

---Here we make sure that hyprland only uses the iGPU, so that the dGPU
---has a chance to shut down.
local function enforce_igpu()
	local gpu_file = io.open("/dev/dri/amd-igpu", "r")
	if not gpu_file then
		return
	end
	gpu_file:close()

	local product_version_file = io.open("/sys/devices/virtual/dmi/id/product_version", "r")
	if not product_version_file then
		return
	end
	local product_version = product_version_file:read("*l")
	product_version_file:close()

	if product_version == "IdeaPad Gaming 3 15ACH6" then
		hl.env("GB_BACKEND", "direct")
		hl.env("AQ_DRM_DEVICES", "/dev/dri/amd-igpu")
		hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_mesa.json")
	end
end

enforce_igpu()
