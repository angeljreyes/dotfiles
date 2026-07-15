---@class Setting
---@field label string | fun(): string
---@field value boolean | string
---@field callback fun(new: boolean | string)?
---@field options table<string, string>?
---@field meta string[]?
---@field call_on_start boolean?
---@field call_on_reload boolean?

local H = {}

H.directory = (os.getenv("XDG_DATA_HOME") or os.getenv("HOME") .. "/.local/share") .. "/hyprland-settings/"

---@type table<string, Setting>
H.settings = {
	lid_behavior = {
		label = "󰌢 Lid behavior",
		options = {
			auto = "Auto",
			nothing = "Nothing",
			sleep = "Sleep",
		},
		value = "sleep",
	},

	night_light = {
		label = "󱩌 Blue light filter",
		meta = { "night light" },
		value = false,
		callback = function(new)
			if new then
				hl.exec_cmd("hyprctl hyprsunset temperature 5200")
			else
				hl.exec_cmd("hyprctl hyprsunset identity")
			end
		end,
		call_on_reload = true,
		call_on_start = true,
	},
}

---@param name string
---@return boolean | string | nil
H.read_setting = function(name)
	local file = io.open(H.directory .. name, "r")
	if file == nil then
		return nil
	end

	local raw = file:read("*a")
	file:close()

	if raw == nil then
		return nil
	elseif raw == "true" then
		return true
	elseif raw == "false" then
		return false
	else
		return raw
	end
end

---@param name string
---@param value boolean | string
H.write_setting = function(name, value)
	local file = io.open(H.directory .. name, "w+")
	if file == nil then
		return
	end
	file:write(tostring(value))
	file:close()
end

H.set_setting = function(name, value)
	H.settings[name].value = value
	H.write_setting(name, value)

	local callback = H.settings[name].callback
	if callback then
		callback(value)
	end
end

---@return string
H.get_menu = function()
	local menu = ""

	for name, setting in pairs(H.settings) do
		local state
		if type(setting.value) == "string" then
			state = setting.options[setting.value]
		else
			state = setting.value and "On" or "Off"
		end
		menu = menu .. name .. [[\0display\x1f]] .. setting.label .. ": " .. state .. [[\x1fmeta\x1f]] .. setting.label

		if setting.meta ~= nil then
			menu = menu .. "," .. table.concat(setting.meta, ",")
		end

		menu = menu .. [[\n]]
	end

	return menu
end

---@param setting Setting
---@return string
H.get_submenu = function(setting)
	local menu = ""

	for key, value in pairs(setting.options) do
		menu = menu .. key .. [[\0display\x1f]] .. value .. [[\x1fmeta\x1f]] .. value .. [[\n]]
	end

	return menu
end

---@param setting Setting
---@param value boolean | string
H.set_value = function(setting, value)
	setting.value = value
end

---@param menu string
---@param callback fun(result: string)
H.dmenu = function(menu, callback)
	Settings.callback = callback
	hl.exec_cmd(
		"hyprctl eval \"Settings.callback('$(printf '"
			.. menu
			.. "' | rofi -dmenu -p Settings -no-custom -no-show-icons -i)')\""
	)
end

---@param name string
H.setting_callback = function(name)
	local setting = H.settings[name]
	if setting == nil then
		return
	end

	if setting.options then
		H.dmenu(H.get_submenu(setting), function(value)
			if setting.options[value] == nil then
				return
			end

			H.set_setting(name, value)
		end)
	else
		H.set_setting(name, not setting.value)
	end
end

Settings = {
	callback = function() end,

	load = function()
		hl.exec_cmd("mkdir -p " .. H.directory)

		for name, setting in pairs(H.settings) do
			local value = H.read_setting(name)
			if
				value == nil -- File doesn't exist
				or (setting.options == nil and type(value) ~= "boolean") -- Boolean setting has non-boolean value
				or (setting.options ~= nil and setting.options[value] == nil) -- Setting is not a valid option
			then
				H.write_setting(name, setting.value) -- Write default value
			else
				setting.value = value
			end
		end
	end,
}

local settings_meta = {
	__index = function(_, key)
		local setting = H.settings[key]
		return setting == nil and nil or setting.value
	end,

	__call = function()
		H.dmenu(H.get_menu(), H.setting_callback)
	end,
}

setmetatable(Settings, settings_meta)

Settings.load()

for _, setting in pairs(H.settings) do
	if setting.call_on_start then
		hl.on("hyprland.start", function()
			if setting.callback then
				setting.callback(setting.value)
			end
		end)
	end

	if setting.call_on_reload then
		hl.on("config.reloaded", function()
			if setting.callback then
				setting.callback(setting.value)
			end
		end)
	end
end
