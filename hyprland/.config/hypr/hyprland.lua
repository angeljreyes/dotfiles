require("modules.monitors")
require("modules.environment")
require("modules.layouts")
require("modules.input")
require("modules.ui")
require("modules.rules")
require("modules.binds")
require("modules.autostart")
require("modules.kb_layouts")

-- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
do local path = os.getenv("HOME") .. "/.config/hypr/hyprmoncfg-monitors.lua"; local file = io.open(path, "r"); if file then file:close(); dofile(path) end end
