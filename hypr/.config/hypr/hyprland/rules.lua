-- Floating placement by intent, not by app.
-- There is intentionally NO blanket float -> center rule and NO per-app
-- overrides: those two together are what caused the endless override loop
-- (OpenOffice dialogs opening anywhere, then Chrome menus opening centered).
-- Order matters: rules are evaluated top to bottom and the last match wins,
-- so the never-center guards at the bottom override the center rules above.

-- Real dialogs: center them wherever they come from.
hl.window_rule({
    name = "center-modal-dialogs",
    match = { modal = true },
    center = true,
})

-- Portal file choosers (xdg-desktop-portal-hyprland tags them portal-dialogs).
hl.window_rule({
    name = "center-portal-choosers",
    match = { tag = "portal-dialogs" },
    float = true,
    center = true,
})

-- Generic file-chooser / dialog titles. Covers LibreOffice, Java-based apps
-- like SweetHome3D, etc. without naming any app.
hl.window_rule({
    name = "center-file-dialogs",
    match = { title = "^(Open|Save( As)?|Export|Import|Print|File Chooser|Select .*|Choose .*)$" },
    float = true,
    center = true,
})

-- XWayland transient windows (Java-style win1, win2, ...): never take focus.
-- Generalized from the old SweetHome3D-only rule, no class constraint.
hl.window_rule({
    name = "transient-xwayland-no-focus",
    match = { xwayland = true, title = "^win[0-9]+$" },
    float = true,
    no_focus = true,
    no_blur = true,
    no_follow_mouse = true,
})

-- Tooltips and similar transient hints: never center, never steal focus.
hl.window_rule({
    name = "never-center-tooltips",
    match = { title = "(?i).*(tooltip|tip|hint|osd).*" },
    center = false,
    no_initial_focus = true,
    no_focus = true,
    no_follow_mouse = true,
    no_blur = true,
})

-- Menus and dropdowns (e.g. Chrome context menu): never center, but DO keep
-- focus so they stay usable (a menu that loses focus vanishes). The min_size
-- avoids 0-size collapse on misbehaving XWayland menus.
hl.window_rule({
    name = "never-center-menus",
    match = { title = "(?i).*(menu|popup|dropdown|combobox|context|autocomplete|suggestion).*" },
    center = false,
    stay_focused = true,
    min_size = { 1, 1 },
})
