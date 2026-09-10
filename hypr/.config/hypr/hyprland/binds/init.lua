local mainMod = "SUPER"

require("hyprland.binds.apps")(mainMod)
require("hyprland.binds.focus")(mainMod)
require("hyprland.binds.workspaces")(mainMod)
require("hyprland.binds.media")()
require("hyprland.binds.tools")(mainMod)

return { mainMod = mainMod }
