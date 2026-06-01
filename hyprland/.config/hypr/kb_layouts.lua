local intl = "0"
local altgr_intl = "1"

local layouts = {
	["1"] = altgr_intl,
	["2"] = intl,
	["3"] = intl,
	["4"] = altgr_intl,
	["5"] = intl,
	["6"] = intl,
	["7"] = intl,
}

local default = altgr_intl

---@param window HL.Window
hl.on("window.active", function(window)
	local layout = layouts[window.workspace.config_name] or default
	hl.exec_cmd("hyprctl switchxkblayout current " .. layout)
end)
