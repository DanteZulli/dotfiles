-- Core app binds (wiki: Configuring > Core > Binds + Dispatchers).
-- Expects (mainMod, programs) so there are no hidden globals.

return function(mainMod, programs)
    hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(programs.terminal))
    hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
    hl.bind(
        mainMod .. " + SHIFT + E",
        hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
    )
    hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(programs.menu))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit")) -- dwindle only
end
