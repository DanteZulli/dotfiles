-- Single source of truth for session env. The session starts via ly +
-- start-hyprland (no uwsm), so systemd environment.d never reaches GUI
-- apps. Do not split these into environment.d again.
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Gruvbox-Green-Dark")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("FREETYPE_PROPERTIES", "truetype:interpreter-version=40")
hl.env("_JAVA_OPTIONS", "-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true")
