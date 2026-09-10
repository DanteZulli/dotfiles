-- Window and workspace rules (wiki: Configuring > Core > Rules > Window rules).
-- https://wiki.hypr.land/configuring/core/rules/window-rules/

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "sweethome3d-tooltip",
    match = { class = "com-eteks-sweethome3d-.*", title = "^win[0-9]+$", xwayland = true },
    float = true,
    no_focus = true,
    no_blur = true,
    no_follow_mouse = true,
    allows_input = false,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move = "20 monitor_h-120",
    float = true,
})
