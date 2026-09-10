-- Keybindings entry point (wiki: Configuring > Core > Binds).
-- https://wiki.hypr.land/configuring/core/binds/
-- Owns mainMod and wires every binds submodule explicitly.

local programs = require("hyprland.programs")

local mainMod = "SUPER"

require("hyprland.binds.apps")(mainMod, programs)
require("hyprland.binds.focus")(mainMod)
require("hyprland.binds.workspaces")(mainMod)
require("hyprland.binds.media")()
require("hyprland.binds.tools")(mainMod)

return { mainMod = mainMod }
