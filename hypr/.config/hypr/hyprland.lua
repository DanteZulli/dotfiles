-- Resolve require("hyprland.*") relative to this config dir.
package.path = os.getenv("HOME")
    .. "/.config/hypr/?.lua;"
    .. os.getenv("HOME")
    .. "/.config/hypr/?/init.lua;"
    .. package.path

require("hyprland.monitors")
require("hyprland.autostart")
require("hyprland.env")
require("hyprland.look_and_feel")
require("hyprland.input")
require("hyprland.misc")
require("hyprland.binds")
require("hyprland.rules")
