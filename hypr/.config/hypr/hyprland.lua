-- Hyprland entry point (modular).
-- Wiki: https://wiki.hypr.land/configuring/core/ — config lives in ~/.config/hypr/hyprland.lua
-- Each section lives in hyprland/<section>.lua; binds split further in hyprland/binds/.
-- `hl` is a global injected by Hyprland; modules use it directly (no need to pass it).

-- Allow `require("hyprland.*")` to resolve relative to this config dir.
package.path = os.getenv("HOME")
    .. "/.config/hypr/?.lua;"
    .. os.getenv("HOME")
    .. "/.config/hypr/?/init.lua;"
    .. package.path

require("hyprland.monitors")
require("hyprland.programs") -- cached; consumed by autostart/binds
require("hyprland.autostart")
require("hyprland.env")
require("hyprland.look_and_feel")
require("hyprland.input")
require("hyprland.misc")
require("hyprland.binds")
require("hyprland.rules")
