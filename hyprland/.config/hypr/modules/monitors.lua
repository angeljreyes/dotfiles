local M = {}
local vars = require("modules.variables")

hl.monitor({
	output = vars.laptop_monitor,
	mode = "preferred",
	position = "0x0",
	scale = 1.2,
})

if Settings.monitors == "default" then
	hl.monitor({
		output = vars.external_monitor1,
		mode = "preferred",
		position = "1600x-550",
		scale = 1,
	})
end

if Settings.monitors == "extend" then
	hl.monitor({
		output = "",
		position = "auto",
		mode = "preferred",
	})
elseif Settings.monitors == "only_main" then
	hl.monitor({
		output = "",
		disabled = true,
	})
else
	hl.monitor({
		output = "",
		position = "auto",
		mirror = vars.laptop_monitor,
	})
end

return M
