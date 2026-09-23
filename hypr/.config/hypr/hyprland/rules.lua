hl.window_rule({
    name = "center-modal-dialogs",
    match = { modal = true },
    center = true,
})

hl.window_rule({
    name = "center-portal-choosers",
    match = { tag = "portal-dialogs" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "center-file-dialogs",
    match = { title = "^(Open|Save( As)?|Export|Import|Print|File Chooser|Select .*|Choose .*)$" },
    float = true,
    center = true,
})

hl.window_rule({
    name = "transient-xwayland-no-focus",
    match = { xwayland = true, title = "^win[0-9]+$" },
    float = true,
    no_focus = true,
    no_blur = true,
    no_follow_mouse = true,
})

hl.window_rule({
    name = "never-center-tooltips",
    match = { title = "(?i).*(tooltip|tip|hint|osd).*" },
    center = false,
    no_initial_focus = true,
    no_focus = true,
    no_follow_mouse = true,
    no_blur = true,
})

hl.window_rule({
    name = "never-center-menus",
    match = { title = "(?i).*(menu|popup|dropdown|combobox|context|autocomplete|suggestion).*" },
    center = false,
    stay_focused = true,
    min_size = { 1, 1 },
})
