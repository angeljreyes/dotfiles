local M = {}
local vars = require("modules.variables")


hl.monitor({
    output = vars.laptop_monitor,
	mode = "preferred",
    position = "0x0",
    scale = 1.2,
})

hl.monitor({
    output = vars.external_monitor1,
	mode = "preferred",
    position = "1600x-550",
    scale = 1,
})

hl.monitor({
    output = "",
    position = "auto",
    mirror = vars.laptop_monitor,
})

return M
