local settings_directory = (os.getenv("XDG_STATE_HOME") or os.getenv("HOME") .. "/.local/state") .. "/hypr-settings/"
local monitor_setting_path = settings_directory .. "monitor"
hl.exec_cmd("mkdir -p " .. settings_directory)

do
	local setting = "Extend"
	local file = io.open(monitor_setting_path, "r")
	if file ~= nil then
		setting = file:read("*a")
		file:close()
	end
	if setting == "Extend" then
		hl.monitor({
			output = "",
			position = "auto",
			mode = "preferred",
			mirror = "",
		})
	elseif setting == "Main monitor only" then
		hl.monitor({
			output = "",
			disabled = true,
			mirror = "",
		})
	elseif setting == "Mirror" then
		hl.monitor({
			output = "",
			position = "auto",
			mirror = hl.get_monitors()[1].name,
		})
	end
end

---@param mode string
function SetDefaultMonitorMode(mode)
	local file = io.open(monitor_setting_path, "w+")
	if file == nil then
		return
	end
	file:write(mode)
	file:close()
end
