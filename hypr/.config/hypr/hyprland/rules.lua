hl.window_rule({
    name = "sweethome3d-tooltip",
    match = { class = "com-eteks-sweethome3d-.*", title = "^win[0-9]+$", xwayland = true },
    float = true,
    no_focus = true,
    no_blur = true,
    no_follow_mouse = true,
})
